defmodule Mtapes.Playlists.Playlist do
  use Ecto.Schema
  import Ecto.Changeset

  schema "playlists" do
    belongs_to :user, Mtapes.Users.User
    field :name, :string, null: false
    field :description, :string
    field :spotify_id, :string

  end

  def changeset(playlist, params \\ %{}) do
    playlist
      |> cast(params, [:user_id, :name, :description, :spotify_id])
      |> validate_required([:user_id, :name])
  end
end
