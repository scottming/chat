defmodule Chat.Accounts.Commands.RegisterUser do
  defstruct user_uuid: "", username: "", email: "", password: "", hashed_password: ""

  use ExConstructor

  alias __MODULE__
  import Chat.CommonValidators.UUID, only: [uuid_regex: 0]
  alias Chat.Accounts.Validators.UniqueUsername

  alias Chat.Auth

  def valid?(command) do
    Skooma.valid?(Map.from_struct(command), schema())
  end

  defp schema() do
    %{
      user_uuid: [:string, Skooma.Validators.regex(uuid_regex())],
      username: [:string, &UniqueUsername.validate(&1)],
      email: :string,
      password: :string
    }
  end

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
