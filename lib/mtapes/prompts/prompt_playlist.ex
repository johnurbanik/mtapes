defmodule Mtapes.Prompts.PromptPlaylist do
  use Ecto.Schema
  import Ecto.Changeset

  schema "prompts_playlists" do
    field :prompt_id, :id
    field :playlist_id, :id

    timestamps()
  end

  @doc false
  def changeset(prompt_playlist, attrs) do
    prompt_playlist
    |> cast(attrs, [])
    |> validate_required([])
  end
end
