defmodule Mtapes.Repo.Migrations.AddSongDetails do
  use Ecto.Migration

  def change do
    alter table(:songs) do
      add :image, :string
      add :url, :string
    end
  end
end
