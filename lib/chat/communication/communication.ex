defmodule Chat.Communication do
  alias Chat.Repo
  alias Chat.Communication.Projections.Room

  def get_room_by(condition) do
    Repo.get_by(Room, condition)
  end
end
