defmodule Chat.Factory do
  use ExMachina

  alias Chat.Accounts.Commands.RegisterUser

  def user_factory() do
    %{
      user_uuid: UUID.uuid4(),
      username: sequence("scott"),
      email: sequence(:email, &"email-#{&1}@example.com"),
      password: "abcabc"
    }
  end

  def register_user_factory do
    struct(RegisterUser, build(:user))
  end
end
