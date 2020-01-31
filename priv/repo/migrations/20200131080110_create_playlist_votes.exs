defmodule Mtapes.Repo.Migrations.CreatePlaylistVotes do
  use Ecto.Migration

  def change do
    create table(:playlist_votes) do
      add :direction, :integer
      add :prompt_id, references(:prompts, on_delete: :nothing), primary_key: True
      add :user_id, references(:users, on_delete: :nothing), primary_key: True
      add :playlist_id, references(:playlists, on_delete: :nothing), primary_key: True

      timestamps()
    end

    create index(:playlist_votes, [:prompt_id])
    create index(:playlist_votes, [:user_id])
    create index(:playlist_votes, [:playlist_id])
    create unique_index(:playlist_votes, [:prompt_id, :user_id, :playlist_id])
  end
end
