defmodule Chat.Accounts.Commands.RegisterUser do
  defstruct user_uuid: "", username: "", email: "", password: "", hashed_password: ""

  use ExConstructor
  use Vex.Struct

  alias __MODULE__
  alias Chat.Accounts.Validators.UniqueUsername
  alias Chat.Auth

  validates(:user_uuid, uuid: true)

  validates(:username,
    presence: [message: "can't be empty"],
    format: [with: ~r/^[a-z0-9]]+$/, message: "is invalid"],
    string: true,
    by: &UniqueUsername.validate/2
  )

  def assign_uuid(%RegisterUser{} = register_user, uuid) do
    %{register_user | user_uuid: uuid}
  end

  def downcase_username(%RegisterUser{username: username} = register_user) do
    %{register_user | username: String.downcase(username)}
  end

  def hashed_password(%RegisterUser{password: password} = register_user) do
    %{register_user | password: nil, hashed_password: Auth.hash_password(password)}
  end
end
