defmodule Mtapes.Playlists.Song do
  use Ecto.Schema
  import Ecto.Changeset

  schema "songs" do
    field :artist, :string
    field :name, :string
    field :playlist_id, :id

    timestamps()
  end

  @doc false
  def changeset(song, attrs) do
    song
    |> cast(attrs, [:name, :artist])
    |> validate_required([:name, :artist])
  end
end
