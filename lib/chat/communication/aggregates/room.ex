defmodule Chat.Communication.Aggregates.Room do
  defstruct [:uuid, :name, :type, :owner_id, :room_users]

  alias __MODULE__
  alias Chat.Communication.Commands.{CreateChannel, JoinChannel, CreateDirectChat, NotifyRoomUsers}
  alias Chat.Communication.Events.{ChannelCreated, ChannelJoined, DirectChatCreated, RoomUsersNotified}

end
