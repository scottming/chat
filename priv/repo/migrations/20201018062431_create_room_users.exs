defmodule Chat.Repo.Migrations.CreateRoomUsers do
  use Ecto.Migration

  def change do
    create table(:room_users) do
      add :role, :string
      add :room_id, references(:room, on_delete: :nothing)
      add :user_id, references(:users, on_delete: :nothing)

      timestamps()
    end

    create index(:room_users, [:room_id])
    create index(:room_users, [:user_id])
  end
end
