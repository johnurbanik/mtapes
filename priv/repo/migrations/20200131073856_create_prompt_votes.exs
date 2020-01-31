defmodule Mtapes.Repo.Migrations.CreatePromptVotes do
  use Ecto.Migration

  def change do
    create table(:prompt_votes) do
      add :prompt_id, references(:prompts, on_delete: :nothing), primary_key: True
      add :user_id, references(:users, on_delete: :nothing), primary_key: True

      add :direction, :integer
      timestamps()
    end

    create index(:prompt_votes, [:prompt_id])
    create index(:prompt_votes, [:user_id])
    create unique_index(:prompt_votes, [:prompt_id, :user_id])
  end
end
