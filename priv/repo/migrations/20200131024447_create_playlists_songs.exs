defmodule Mtapes.Repo.Migrations.CreatePlaylistsSongs do
  use Ecto.Migration

  def change do
    create table(:playlists_songs) do
      add :playlist_id, references(:playlists, on_delete: :delete_all), primary_key: True
      add :song_id, references(:songs, on_delete: :delete_all), primary_key: True
    end

    create index(:playlists_songs, [:playlist_id])
    create index(:playlists_songs, [:song_id])
    create unique_index(:playlists_songs, [:playlist_id, :song_id])
  end
end
