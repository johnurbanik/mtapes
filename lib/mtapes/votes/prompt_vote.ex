defmodule Mtapes.Votes.PromptVote do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  schema "prompt_votes" do
    field :direction, :integer
    belongs_to :prompt_id, Mtapes.Prompts.Prompt, primary_key: True
    belongs_to :user_id, Mtapes.Users.User, primary_key: True

    timestamps()
  end

  @doc false
  def changeset(prompt_vote, attrs) do
    prompt_vote
    |> cast(attrs, [:direction, :prompt_id, :user_id])
    |> validate_required([:direction, :prompt_id, :user_id])
  end
end
