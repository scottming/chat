defmodule Chat.Repo.Migrations.CreateRoomUsers do
  use Ecto.Migration

  def change do
    create table(:room_users, primary_key: false) do
      add :role, :string
      add :room_uuid, references(:rooms, column: :uuid, type: :uuid, on_delete: :nothing)
      add :user_uuid, references(:accounts_users, column: :uuid, type: :uuid, on_delete: :nothing)

      timestamps()
    end

    create index(:room_users, [:room_uuid])
    create index(:room_users, [:user_uuid])
    create unique_index(:room_users, [:room_uuid, :user_uuid])
  end
end
