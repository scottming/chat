defmodule Chat.Router do
  use Commanded.Commands.Router

  alias Chat.Accounts.Aggregates.User
  alias Chat.Accounts.Commands.RegisterUser
  alias Chat.Middleware.ValidateCommand

  middleware(ValidateCommand)

  identify(User, by: :user_uuid, prefix: "user-")

  dispatch([RegisterUser], to: User)
end
