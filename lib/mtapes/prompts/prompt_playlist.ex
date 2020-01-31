defmodule Mtapes.Prompts.PromptPlaylist do
  use Ecto.Schema
  import Ecto.Changeset

  schema "prompts_playlists" do
    field :prompt_id, :id
    field :playlist_id, :id

    field :weight, :float, default: 0

    timestamps()
  end

  @doc false
  def changeset(prompt_playlist, attrs) do
    prompt_playlist
    |> cast(attrs, [:prompt_id, :playlist_id])
    |> validate_required([:prompt_id, :playlist_id])
  end
end
