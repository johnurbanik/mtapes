defmodule Mtapes.Users.User do
  use Ecto.Schema
  use Pow.Ecto.Schema
  use PowAssent.Ecto.Schema

  schema "users" do
    pow_user_fields()

    timestamps()
    has_many :playlists, Mtapes.Playlists.Playlist
  end
end
