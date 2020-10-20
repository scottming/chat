defmodule Chat.Communication do
  alias Chat.App
  alias Chat.Repo
  alias Chat.Communication.Projections.Room

  alias Chat.Communication.Commands.CreateChannel

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

  defp get(schema, uuid, preload_schema) do
    case get(schema, uuid) do
      {:ok, projection} -> projection |> Repo.preload(preload_schema)
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
