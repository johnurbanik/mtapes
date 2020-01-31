defmodule Mtapes.Prompts.Prompt do
  use Ecto.Schema
  import Ecto.Changeset
  alias Mtapes.Playlists.Playlist

  schema "prompts" do
    field :accepting_submissions, :boolean, default: false
    field :body, :string, null: false
    field :image, :string
    field :title, :string, null: false
    field :weight, :float, default: 0
    belongs_to :user_id, Mtapes.Users.User
    many_to_many :playlist_id, Playlist, join_through: "prompts_playlists", on_replace: :delete

    timestamps()
  end

  @doc false
  def changeset(prompt, attrs) do
    prompt
    |> cast(attrs, [:title, :body, :image, :weight, :accepting_submissions])
    |> validate_required([:title, :body])
  end
end
