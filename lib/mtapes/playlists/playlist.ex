defmodule Mtapes.Playlists.Playlist do
  use Ecto.Schema
  import Ecto.Changeset
  alias Mtapes.Playlists.Song

  schema "playlists" do
    belongs_to :user, Mtapes.Users.User
    field :name, :string, null: false
    field :description, :string
    field :spotify_id, :string
    many_to_many :songs, Song, join_through: "playlists_songs", on_replace: :delete

    timestamps()
  end

  def changeset(playlist, params \\ %{}) do
    playlist
      |> cast(params, [:user_id, :name, :description, :spotify_id])
      |> validate_required([:user_id, :name])
  end
end
