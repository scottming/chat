defmodule Chat.Repo.Migrations.CreateRooms do
  use Ecto.Migration

  def change do
    create table(:rooms, primary_key: false) do
      add :uuid, :uuid, primary_key: true
      add :name, :string
      add :type, :string
      add :owner_uuid, references(:accounts_users, column: :uuid, on_delete: :nothing, type: :uuid)

      timestamps()
    end

    create index(:rooms, [:owner_uuid])
  end
end
