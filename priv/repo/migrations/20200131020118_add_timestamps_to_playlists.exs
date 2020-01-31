defmodule Mtapes.Repo.Migrations.CreatePlaylist do
  use Ecto.Migration

  def change do
    alter table(:playlists) do
      timestamps(null: true)
    end
    execute("UPDATE playlists SET inserted_at = now()")
    execute("UPDATE playlists SET updated_at = now()")
    alter table(:playlists) do
      modify :inserted_at, :naive_datetime, null: false
      modify :updated_at, :naive_datetime, null: false
    end

  end
end
