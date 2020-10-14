defmodule Chat.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users, primary_key: false) do
      add :uuid, :uuid, primary_key: true
      add :username, :string
      add :email, :string
      add :hashed_password, :string

      timestamps()
    end

    create unique_index(:users, [:username])
  end
end
