defmodule Chat.Router do
  use Commanded.Commands.Router

  alias Chat.Accounts.Aggregates.User
  alias Chat.Accounts.Commands.RegisterUser

  alias Chat.Support.Middleware.{Uniqueness, Validate}

  middleware(Uniqueness)
  middleware(Validate)

  identify(User, by: :user_uuid, prefix: "user-")

  dispatch([RegisterUser], to: User)
end
