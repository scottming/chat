defmodule Chat.Communication.Validator.UniqueChannelName do
  use Vex.Validator

  alias Chat.Communication
  alias Chat.Communication.Projections.Room

  def validate(value, context) do
    room_uuid = Map.get(context, :room_uuid)

    case room_name_exists?(value, room_uuid) do
      true -> {:error, "has already been taken"}
      false -> :ok
    end
  end

  def room_name_exists?(room_name, room_uuid) do
    case Communication.get_room_by(name: room_name) do
      %Room{uuid: ^room_uuid} -> false
      nil -> false
      _ -> true
    end
  end
end
