defmodule Chat.Factory do
  use ExMachina

  alias Chat.Accounts.Commands.RegisterUser
  alias Chat.Communication.Commands.CreateChannel

  def user_factory() do
    %{
      user_uuid: UUID.uuid4(),
      username: sequence("scott"),
      email: sequence(:email, &"email-#{&1}@example.com"),
      password: "abcabc"
    }
  end

  def room_factory() do
    %{
      room_uuid: UUID.uuid4(),
      name: sequence(:name, &"room name #{&1}"),
      type: sequence(:type, ["d", "c"])
    }
  end

  def register_user_factory do
    struct(RegisterUser, build(:user))
  end

  def create_channel_factory do
    room = build(:room)
    struct(CreateChannel, room |> Map.put(:channel_uuid, room.room_uuid))
  end
end
