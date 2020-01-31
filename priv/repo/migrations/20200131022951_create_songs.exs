defmodule Mtapes.Repo.Migrations.CreateSongs do
  use Ecto.Migration

  def up do
    create table(:songs) do
      add :name, :string
      add :artist, :string
      add :spotify_id, :string
    end

    drop constraint("playlists", "playlists_user_id_fkey")
    alter table(:playlists) do
      modify :user_id, references(:users, on_delete: :delete_all)
    end

    create unique_index(:playlists, [:spotify_id])
    create unique_index(:songs, [:spotify_id])
  end

  def down do
    drop table(:songs)

    drop constraint("playlists", "playlists_user_id_fkey")
    alter table(:playlists) do
      modify :user_id, references(:users, on_delete: :nothing)
    end

    drop index(:songs, [:playlist_id])
    drop unique_index(:playlists, [:spotify_id])
    drop unique_index(:songs, [:spotify_id])
  end
end
