defmodule Chat.Auth do
  def hash_password(password) do
    %{password_hash: hashed_password} = Argon2.add_hash(password)
    hashed_password
  end
end
