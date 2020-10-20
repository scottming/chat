defmodule Chat.Fixture do
  import Chat.Factory
  alias Chat.Accounts
  alias Chat.Communication

  def register_user(_context) do
    {:ok, user} = fixture(:user)
    [user: user]
  end

  def fixture(resource, attrs \\ [])

  def fixture(:user, attrs) do
    build(:user, attrs) |> Accounts.register_user()
  end

  def fixture(:channel, attrs) do
    build(:channel, attrs) |> Communication.create_channel()
  end
end
