defmodule Chat.Fixture do
  import Chat.Factory
  alias Chat.Accounts

  def register_user(_context) do
    {:ok, user} = fixture(:user)

    [user: user]
  end

  def fixture(resource, attrs \\ [])

  def fixture(:user, attrs) do
    build(:user, attrs) |> Accounts.register_user()
  end
end
