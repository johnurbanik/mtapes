defmodule Mtapes.Playlists.Song do
  use Ecto.Schema
  import Ecto.Changeset
  alias Mtapes.Playlists.Playlist

  schema "songs" do
    field :artist, :string
    field :name, :string
    field :spotify_id, :string
    many_to_many :playlists, Playlist, join_through: "playlists_songs", on_replace: :delete
  end

  @doc false
  def changeset(song, attrs) do
    song
    |> cast(attrs, [:name, :artist, :spotify_id])
    |> validate_required([:name, :artist, :spotify_id])
  end
end
