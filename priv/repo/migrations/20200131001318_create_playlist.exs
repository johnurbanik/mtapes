defmodule Mtapes.Repo.Migrations.CreatePlaylist do
  use Ecto.Migration

  def change do
    create table(:playlist) do
      add :user_id, references(:users), null: false
      add :name, :string, null: false
      add :description, :string
      add :spotify_id, :string
    end

    create unique_index(:playlist, [:user_id, :name])
  end
end
