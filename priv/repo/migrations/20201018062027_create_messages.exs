defmodule Chat.Repo.Migrations.CreateMessages do
  use Ecto.Migration

  def change do
    create table(:messages, primary_key: false) do
      add :uuid, :uuid, primary_key: true
      add :content, :string
      add :type, :string
      add :room_uuid, references(:rooms, column: :uuid, type: :uuid, on_delete: :nothing)
      add :user_uuid, references(:accounts_users, column: :uuid, type: :uuid, on_delete: :nothing)

      timestamps()
    end

    create index(:messages, [:room_uuid])
    create index(:messages, [:user_uuid])
  end
end
