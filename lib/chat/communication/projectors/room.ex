defmodule Chat.Communication.Projectors.Room do
  use Commanded.Projections.Ecto,
    application: Chat.App,
    name: "Communication.Projectors.User",
    consistency: :strong

  alias Chat.Communication.Events.{ChannelCreated, ChannelJoined}
  alias Chat.Communication.Projections.Room
  alias Chat.Communication.Projections.RoomUser

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
end
