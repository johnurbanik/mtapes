defmodule Mtapes.Repo.Migrations.CreatePlaylist do
  use Ecto.Migration

  def change do
    create table(:playlist) do
      add :name, :string
      add :description, :string
      add :spotify_id, :string

      timestamps()
    end

  end
end
