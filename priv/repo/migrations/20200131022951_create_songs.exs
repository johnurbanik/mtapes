defmodule Mtapes.Repo.Migrations.CreateSongs do
  use Ecto.Migration

  def change do
    create table(:songs) do
      add :name, :string
      add :artist, :string
      spotify_id, :string

      timestamps()
    end

    # create table(:playlists_songs) do
    #   add :playlist_id, references(:playlists, on_delete: :delete_all), primary_key: True
    #   add :song_id, references(:songs, on_delete: :delete_all), primary_key: True
    # end

    # create index(:playlists_songs, [:playlist_id])
    # create index(:playlists_songs, [:song_id])
    # create unique_index(:playlists_songs, [:playlist_id, :song_id])

    alter table(:playlists) do
      alter :user_id, references(:users, on_delete: :delete_all)
    end



    create index(:songs, [:playlist_id])
    create unique_index(:playlists, [:spotify_id])
    create unique_index(:songs, [:spotify_id])
  end
end
