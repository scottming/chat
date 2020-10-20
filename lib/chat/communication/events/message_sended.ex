defmodule Chat.Communication.Events.MessageSended do
  @derive Jason.Encoder
  defstruct [:message_uuid, :room_uuid, :content, :user_uuid, :type]
end
