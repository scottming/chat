defmodule Chat.Communication.Validators.ExistentChannel do
  alias Chat.Communication
  alias Chat.Communication.Projections.Room

  def valid(channel_uuid) do
    case Communication.get_room_by(uuid: channel_uuid, type: "c") do
      %Room{} -> :ok
      _ -> {:error, "channel_not_found"}
    end
  end
end
