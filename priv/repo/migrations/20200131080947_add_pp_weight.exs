defmodule Mtapes.Repo.Migrations.AddPpWeight do
  use Ecto.Migration

  def change do
    alter table(:prompts_playlists) do
      add :weight, :float, default: 0
    end

    create index(:prompts_playlists, [:weight])
    create index(:prompts, [:weight])

  end
end
