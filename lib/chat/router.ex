defmodule Chat.Router do
  use Commanded.Commands.Router

  alias Chat.Accounts.Aggregates.User
  alias Chat.Accounts.Commands.RegisterUser

  alias Chat.Communication.Aggregates.Room
  alias Chat.Communication.Commands.{CreateChannel, JoinChannel, SendMessage}
  alias Chat.Middleware.ValidateCommand

  middleware(ValidateCommand)

  identify(User, by: :user_uuid, prefix: "user-")

  dispatch([RegisterUser], to: User)

  # dispatch without indentify
  dispatch([CreateChannel, JoinChannel], to: Room, identity: :channel_uuid, identity_prefix: "room-")
  dispatch([SendMessage], to: Room, identity: :room_uuid, identity_prefix: "room-")
end
