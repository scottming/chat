defmodule Chat.CommunicationTest do
  use Chat.DataCase

  alias Chat.Communication

  describe "create channel" do
    @tag :integration
    test "should failed with not valid data" do
      user_uuid = UUID.uuid4()

      assert {:error, :command_validation_failure, %{owner_uuid: ^user_uuid}, errors} =
               Communication.create_channel(build(:create_channel, owner_uuid: user_uuid))

      assert ["owner_not_found"] = errors
    end

    setup [:register_user]

    @tag :integration
    test "should succeed with valid data", %{user: %{uuid: user_uuid}} do
      # assert the owner the room users
      assert {:ok, %{owner_uuid: ^user_uuid, users: [%{uuid: ^user_uuid}]}} =
               Communication.create_channel(build(:create_channel, owner_uuid: user_uuid))
    end
  end

  describe "join channel" do
    setup [:register_user, :create_channel]

    @tag :integration
    test "should failed when channel not exist.", %{user: %{uuid: user_uuid}} do
      channel_uuid = UUID.uuid4()
      attrs = build(:join_channel, channel_uuid: channel_uuid, user_uuid: user_uuid)
      assert {:error, _, _, ["channel_not_found"]} = Communication.join_channel(attrs)
    end

    @tag :integration
    test "should succeed with valid data", %{
      user: %{uuid: user_uuid},
      channel: %{uuid: channel_uuid}
    } do
      attrs = build(:join_channel, channel_uuid: channel_uuid, user_uuid: user_uuid)
      assert {:ok, %{users: users}} = Communication.join_channel(attrs)
      user_ids = Enum.map(users, & &1.uuid)

      # assert there are 2 users in channel
      assert user_ids |> Enum.uniq() |> length == 2
      assert user_uuid in user_ids
    end
  end

  describe "send message" do
    setup [:join_channel]

    @tag :integration
    test "should failed when content length is not valid", %{channel_uuid: cid, user_uuid: uid} do
      attrs = build(:send_message, room_uuid: cid, user_uuid: uid, content: nil)
      assert {:error, _, _, _} = Communication.send_message(attrs)
    end
  end
end
