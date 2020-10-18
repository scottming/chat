defmodule Chat.CommunicationTest do
  use Chat.DataCase

  alias Chat.Communication

  describe "rooms" do
    alias Chat.Communication.Room

    @valid_attrs %{name: "some name", type: "some type"}
    @update_attrs %{name: "some updated name", type: "some updated type"}
    @invalid_attrs %{name: nil, type: nil}

    def room_fixture(attrs \\ %{}) do
      {:ok, room} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Communication.create_room()

      room
    end

    test "list_rooms/0 returns all rooms" do
      room = room_fixture()
      assert Communication.list_rooms() == [room]
    end

    test "get_room!/1 returns the room with given id" do
      room = room_fixture()
      assert Communication.get_room!(room.id) == room
    end

    test "create_room/1 with valid data creates a room" do
      assert {:ok, %Room{} = room} = Communication.create_room(@valid_attrs)
      assert room.name == "some name"
      assert room.type == "some type"
    end

    test "create_room/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Communication.create_room(@invalid_attrs)
    end

    test "update_room/2 with valid data updates the room" do
      room = room_fixture()
      assert {:ok, %Room{} = room} = Communication.update_room(room, @update_attrs)
      assert room.name == "some updated name"
      assert room.type == "some updated type"
    end

    test "update_room/2 with invalid data returns error changeset" do
      room = room_fixture()
      assert {:error, %Ecto.Changeset{}} = Communication.update_room(room, @invalid_attrs)
      assert room == Communication.get_room!(room.id)
    end

    test "delete_room/1 deletes the room" do
      room = room_fixture()
      assert {:ok, %Room{}} = Communication.delete_room(room)
      assert_raise Ecto.NoResultsError, fn -> Communication.get_room!(room.id) end
    end

    test "change_room/1 returns a room changeset" do
      room = room_fixture()
      assert %Ecto.Changeset{} = Communication.change_room(room)
    end
  end

  describe "messages" do
    alias Chat.Communication.Message

    @valid_attrs %{content: "some content", type: "some type"}
    @update_attrs %{content: "some updated content", type: "some updated type"}
    @invalid_attrs %{content: nil, type: nil}

    def message_fixture(attrs \\ %{}) do
      {:ok, message} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Communication.create_message()

      message
    end

    test "list_messages/0 returns all messages" do
      message = message_fixture()
      assert Communication.list_messages() == [message]
    end

    test "get_message!/1 returns the message with given id" do
      message = message_fixture()
      assert Communication.get_message!(message.id) == message
    end

    test "create_message/1 with valid data creates a message" do
      assert {:ok, %Message{} = message} = Communication.create_message(@valid_attrs)
      assert message.content == "some content"
      assert message.type == "some type"
    end

    test "create_message/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Communication.create_message(@invalid_attrs)
    end

    test "update_message/2 with valid data updates the message" do
      message = message_fixture()
      assert {:ok, %Message{} = message} = Communication.update_message(message, @update_attrs)
      assert message.content == "some updated content"
      assert message.type == "some updated type"
    end

    test "update_message/2 with invalid data returns error changeset" do
      message = message_fixture()
      assert {:error, %Ecto.Changeset{}} = Communication.update_message(message, @invalid_attrs)
      assert message == Communication.get_message!(message.id)
    end

    test "delete_message/1 deletes the message" do
      message = message_fixture()
      assert {:ok, %Message{}} = Communication.delete_message(message)
      assert_raise Ecto.NoResultsError, fn -> Communication.get_message!(message.id) end
    end

    test "change_message/1 returns a message changeset" do
      message = message_fixture()
      assert %Ecto.Changeset{} = Communication.change_message(message)
    end
  end

  describe "room_users" do
    alias Chat.Communication.RoomUser

    @valid_attrs %{role: "some role"}
    @update_attrs %{role: "some updated role"}
    @invalid_attrs %{role: nil}

    def room_user_fixture(attrs \\ %{}) do
      {:ok, room_user} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Communication.create_room_user()

      room_user
    end

    test "list_room_users/0 returns all room_users" do
      room_user = room_user_fixture()
      assert Communication.list_room_users() == [room_user]
    end

    test "get_room_user!/1 returns the room_user with given id" do
      room_user = room_user_fixture()
      assert Communication.get_room_user!(room_user.id) == room_user
    end

    test "create_room_user/1 with valid data creates a room_user" do
      assert {:ok, %RoomUser{} = room_user} = Communication.create_room_user(@valid_attrs)
      assert room_user.role == "some role"
    end

    test "create_room_user/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Communication.create_room_user(@invalid_attrs)
    end

    test "update_room_user/2 with valid data updates the room_user" do
      room_user = room_user_fixture()
      assert {:ok, %RoomUser{} = room_user} = Communication.update_room_user(room_user, @update_attrs)
      assert room_user.role == "some updated role"
    end

    test "update_room_user/2 with invalid data returns error changeset" do
      room_user = room_user_fixture()
      assert {:error, %Ecto.Changeset{}} = Communication.update_room_user(room_user, @invalid_attrs)
      assert room_user == Communication.get_room_user!(room_user.id)
    end

    test "delete_room_user/1 deletes the room_user" do
      room_user = room_user_fixture()
      assert {:ok, %RoomUser{}} = Communication.delete_room_user(room_user)
      assert_raise Ecto.NoResultsError, fn -> Communication.get_room_user!(room_user.id) end
    end

    test "change_room_user/1 returns a room_user changeset" do
      room_user = room_user_fixture()
      assert %Ecto.Changeset{} = Communication.change_room_user(room_user)
    end
  end
end
