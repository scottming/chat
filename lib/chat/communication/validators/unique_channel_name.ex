defmodule Chat.Communication.Validator.UniqueChannelName do
  alias Chat.Communication
  alias Chat.Communication.Projections.Room

  def validate(value) do
    case room_name_exists?(value) do
      true -> {:error, "has already been taken"}
      false -> :ok
    end
  end

  def room_name_exists?(value) do
    case Communication.get_room_by(name: value) do
      %Room{} -> true
      _ -> false
    end
  end
end
