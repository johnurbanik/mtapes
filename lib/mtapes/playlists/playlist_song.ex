defmodule Mtapes.Playlists.PlaylistSong do
  use Ecto.Schema
  import Ecto.Changeset

  schema "playlists_songs" do
    field :playlist_id, :id
    field :song_id, :id

    timestamps()
  end

  @doc false
  def changeset(playlist_song, attrs) do
    playlist_song
    |> cast(attrs, [:playlist_id, "song_id"])
    |> validate_required([:playlist_id, "song_id"])
  end
end
