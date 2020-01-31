defmodule Mtapes.Repo.Migrations.CreateSongs do
  use Ecto.Migration

  def change do
    create table(:songs) do
      add :name, :string
      add :artist, :string
      add :playlist_id, references(:playlist, on_delete: :delete_all)

      timestamps()
    end

    create index(:songs, [:playlist_id])
  end
end
