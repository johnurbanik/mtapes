defmodule Mtapes.Playlists.PlaylistSong do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  schema "playlists_songs" do
    belongs_to :playlist_id, Mtapes.Playlists.Playlist, primary_key: True
    belongs_to :song_id, Mtapes.Playlists.Song, primary_key: True

    timestamps()
  end

  @doc false
  def changeset(playlist_song, attrs) do
    playlist_song
    |> cast(attrs, [:playlist_id, "song_id"])
    |> validate_required([:playlist_id, "song_id"])
  end
end
