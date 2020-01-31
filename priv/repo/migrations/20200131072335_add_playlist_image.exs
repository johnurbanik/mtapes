defmodule Mtapes.Repo.Migrations.AddPlaylistImage do
  use Ecto.Migration

  def change do
    alter table(:playlists) do
      add :image, :string
    end

  end
end
