defmodule Chat.Communication.Commands.NotityUsers do
  defstruct room_uuid: "", content: "", sender_uuid: "", user_uuids: ""
  alias __MODULE__

  use ExConstructor

  def valid?(_) do
    :ok
  end

  def assign_user_uuid(%NotityUsers{} = notify_users, user_uuids) do
    %NotityUsers{notify_users | user_uuids: user_uuids}
  end
end
