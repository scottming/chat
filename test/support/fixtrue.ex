defmodule Chat.Fixture do
  import Chat.Factory
  alias Chat.Accounts
  alias Chat.Communication

  def register_user(_context) do
    {:ok, user} = fixture(:user)
    [user: user]
  end

  def create_channel(_context) do
    {:ok, channel} = fixture(:channel)
    [channel: channel]
  end

  def join_channel(_context) do
    {:ok, user} = fixture(:user)
    {:ok, channel_room} = fixture(:channel)

    {:ok, channel_room} =
      build(:join_channel, channel_uuid: channel_room.uuid, user_uuid: user.uuid)
      |> Communication.join_channel()

    [user_uuid: user.uuid, channel_uuid: channel_room.uuid]
  end

  def fixture(resource, attrs \\ [])

  def fixture(:user, attrs) do
    build(:user, attrs) |> Accounts.register_user()
  end

  def fixture(:channel, attrs) do
    {:ok, user} = fixture(:user)
    build(:channel, [owner_uuid: user.uuid] ++ attrs) |> Communication.create_channel()
  end
end
