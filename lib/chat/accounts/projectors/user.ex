defmodule Chat.Accounts.Projectors.User do
  use Commanded.Projections.Ecto,
    application: Chat.App,
    name: "Accounts.Projectors.User",
    consistency: :strong

  alias Chat.Accounts.Events.UserRegistered
  alias Chat.Accounts.Projection.User

  project(%UserRegistered{} = registered, fn multi ->
    Ecto.Multi.insert(multi, :user, %User{
      uuid: registered.user_uuid,
      username: registered.username,
      email: registered.email,
      hashed_password: registered.hashed_password
    })
  end)
end
