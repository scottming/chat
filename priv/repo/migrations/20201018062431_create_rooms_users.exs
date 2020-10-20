defmodule Chat.Repo.Migrations.CreateRoomUsers do
  use Ecto.Migration

  def change do
    create table(:rooms_users, primary_key: false) do
      add :role, :string
      add :room_uuid, references(:rooms, column: :uuid, type: :uuid, on_delete: :nothing), primary_key: true
      add :user_uuid, references(:accounts_users, column: :uuid, type: :uuid, on_delete: :nothing), primary_key: true

      timestamps()
    end

    create index(:rooms_users, [:room_uuid])
    create index(:rooms_users, [:user_uuid])
    create unique_index(:rooms_users, [:room_uuid, :user_uuid])
  end
end
