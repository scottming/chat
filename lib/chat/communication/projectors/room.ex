defmodule Chat.Communication.Projectors.Room do
  use Commanded.Projections.Ecto,
    application: Chat.App,
    name: "Communication.Projectors.User",
    consistency: :strong

  alias Chat.Communication.Events.{ChannelCreated, ChannelJoined, MessageSended, UsersNotified}
  alias Chat.Communication.Projections.{Room, RoomUser, Message}

  project(%ChannelCreated{} = channel_created, fn multi ->
    multi
    |> Ecto.Multi.insert(:room, %Room{
      uuid: channel_created.channel_uuid,
      name: channel_created.name,
      type: "c",
      owner_uuid: channel_created.owner_uuid
    })
    |> Ecto.Multi.insert(
      :rooms_users,
      %RoomUser{
        room_uuid: channel_created.channel_uuid,
        user_uuid: channel_created.owner_uuid,
        role: "owner"
      },
      returning: [:room_uuid, :user_uuid]
    )
  end)

  project(%ChannelJoined{} = channel_joined, fn multi ->
    multi
    |> Ecto.Multi.insert(:room_users, %RoomUser{
      room_uuid: channel_joined.channel_uuid,
      user_uuid: channel_joined.user_uuid,
      role: "user"
    })
  end)

  project(%MessageSended{} = message_sended, fn multi ->
    multi
    |> Ecto.Multi.insert(:message, %Message{
      uuid: message_sended.message_uuid,
      room_uuid: message_sended.room_uuid,
      user_uuid: message_sended.user_uuid,
      type: message_sended.type,
      content: message_sended.content
    })
  end)
end
