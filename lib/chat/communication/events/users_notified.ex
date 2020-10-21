defmodule Chat.Communication.Events.UsersNotified do
  @derive Jason.Encoder
  defstruct [:room_uuid, :content, :user_uuids]
end
