defmodule Mtapes.Votes.PlaylistVote do
  use Ecto.Schema
  import Ecto.Changeset

  schema "playlist_votes" do
    field :direction, :integer
    belongs_to :prompt_id, Mtapes.Prompts.Prompt, primary_key: True
    belongs_to :user_id, Mtapes.Users.User, primary_key: True
    belongs_to :playlist_id, Mtapes.Playlists.Playlist, primary_key: True

    timestamps()
  end

  @doc false
  def changeset(playlist_vote, attrs) do
    playlist_vote
    |> cast(attrs, [:direction, :prompt_id, :user_id, :playlist_id])
    |> validate_required([:direction, :prompt_id, :user_id, :playlist_id])
  end
end
