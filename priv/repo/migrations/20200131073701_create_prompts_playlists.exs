defmodule Mtapes.Repo.Migrations.CreatePromptsPlaylists do
  use Ecto.Migration

  def change do
    create table(:prompts_playlists) do
      add :playlist_id, references(:playlists, on_delete: :nothing), primary_key: True
      add :prompt_id, references(:prompts, on_delete: :nothing), primary_key: True
    end

    create index(:prompts_playlists, [:prompt_id])
    create index(:prompts_playlists, [:playlist_id])
    create unique_index(:prompts_playlists, [:prompt_id, :playlist_id])
  end
end
