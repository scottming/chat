defmodule Chat.Communication do
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
  end
end
