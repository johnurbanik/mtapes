defmodule Mtapes.Repo.Migrations.CreatePlaylists do
  use Ecto.Migration

  def change do
    create table(:playlists) do
      add :user_id, references(:users), null: false
      add :name, :string, null: false
      add :description, :string
      add :spotify_id, :string
    end

    create unique_index(:playlists, [:user_id, :name])
  end
end
