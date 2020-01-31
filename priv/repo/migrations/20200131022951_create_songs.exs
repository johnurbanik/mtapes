defmodule Mtapes.Repo.Migrations.CreateSongs do
  use Ecto.Migration

  def change do
    create table(:songs) do
      add :name, :string
      add :artist, :string
      spotify_id, :string
    end


    alter table(:playlists) do
      alter :user_id, references(:users, on_delete: :delete_all)
    end



    create index(:songs, [:playlist_id])
    create unique_index(:playlists, [:spotify_id])
    create unique_index(:songs, [:spotify_id])
  end
end
