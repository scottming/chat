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

    @tag :integration
    test "should succeed with valid data" do
      {:ok, %{uuid: user_uuid}} = fixture(:user)

      # assert the owner the room users
      assert {:ok, %{owner_uuid: ^user_uuid, users: [%{uuid: ^user_uuid}]}} =
               Communication.create_channel(build(:create_channel, owner_uuid: user_uuid))
    end
  end

  describe "join channel" do
    @tag :integration
    test "should succeed with valid data" do
      # fixture 调用两次时会有问题
      {:ok, %{uuid: user_uuid}} = fixture(:user)

      # {:ok, %{uuid: _channel_uuid}} = fixture(:channel, user_uuid: user_uuid)
    end
  end
end
