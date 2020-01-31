defmodule Mtapes.Repo.Migrations.CreatePrompts do
  use Ecto.Migration

  def change do
    create table(:prompts) do
      add :title, :string, null: false
      add :body, :string, null: false
      add :image, :string
      add :weight, :float, default: 0
      add :accepting_submissions, :boolean, default: true, null: false
      add :user_id, references(:users, on_delete: :nothing)

      timestamps()
    end

    create index(:prompts, [:user_id])
  end
end
