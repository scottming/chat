defmodule Chat.Fixture do
  import Chat.Factory
  alias Chat.Accounts

  def register_user(_context) do
    {:ok, user} = fixture(:user) |> IO.inspect(label: "fuck3")

    [user: user]
  end

  def fixture(resource, attrs \\ [])

  def fixture(:user, attrs) do
    attrs |> IO.inspect(label: "fuck4 attrs")
    build(:user, attrs) |> Accounts.register_user() |> IO.inspect(label: "fuck4")
  end
end
