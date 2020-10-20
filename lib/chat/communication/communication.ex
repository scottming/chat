defmodule Chat.Communication do
  alias Chat.App
  alias Chat.Repo
  alias Chat.Communication.Projections.Room

  alias __MODULE__
  alias Chat.Communication.Commands.{CreateChannel, JoinChannel, SendMessage}

  def get_room_by(condition) do
    Repo.get_by(Room, condition)
  end

  def create_channel(attrs) do
    uuid = UUID.uuid4()

    create_channel =
      attrs
      |> CreateChannel.new()
      |> CreateChannel.assign_uuid(uuid)

    with :ok <- App.dispatch(create_channel, consistency: :strong) do
      get(Room, uuid, :users)
    end
  end

  def join_channel(attrs) do
    join_channel = attrs |> JoinChannel.new()

    with :ok <- App.dispatch(join_channel, consistency: :strong) do
      get(Room, attrs.channel_uuid, :users)
    end
  end

  def send_message(attrs) do
    send_message = attrs |> SendMessage.new()

    with :ok <- App.dispatch(send_message, consistency: :strong) do
      get(Room, attrs.room_uuid, :messages)
    end
  end

  import Ecto.Query, only: [from: 2]

  defp get(Room, room_uuid, :messages) do
    case get(Room, room_uuid)  do
      {:ok, projection} -> 
        query = from q in Communication.Projections.Message, order_by: [desc: q.inserted_at], limit: 10
        {:ok, projection |> Repo.preload([messages: query])}
      other -> other
    end
  end

  defp get(schema, uuid, preload_schema) do
    case get(schema, uuid) do
      {:ok, projection} -> {:ok, projection |> Repo.preload(preload_schema)}
      other -> other
    end
  end

  defp get(schema, uuid) do
    case Repo.get(schema, uuid) do
      nil -> {:error, :not_found}
      projection -> {:ok, projection}
    end
  end
end
