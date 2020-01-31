defmodule MtapesWeb.PlaylistController do
  use MtapesWeb, :controller

  alias Mtapes.Playlists
  alias Mtapes.Playlists.Playlist

  require Logger

  def index(conn, _params) do
    playlist = Playlists.list_playlist()
    {:ok, %{ items: playlists }} = Spotify.Playlist.featured(conn)
    render(conn, "index.html", playlist: playlist, playlists: playlists)
  end

  def new(conn, _params) do
    changeset = Playlists.change_playlist(%Playlist{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"playlist" => playlist_params}) do
    case Playlists.create_playlist(playlist_params) do
      {:ok, playlist} ->
        conn
        |> put_flash(:info, "Playlist created successfully.")
        |> redirect(to: Routes.playlist_path(conn, :show, playlist))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end


  def show(conn, %{"id" => id}) do
    playlist = Playlists.get_playlist!(id)
    {:ok, details} = Spotify.Playlist.get_playlist(conn, Spotify.current_user, playlist.spotify_id)


    render(conn, "show.html", playlist: playlist, details: details.tracks["items"] |>  Enum.map(&artist_track/1))
  end

  defp artist_track(track) do
    t = track["track"]
    artist = t["artists"]|> Enum.map(&(&1["name"])) |> Enum.join(", ")
    image = (t["album"]["images"] |> Enum.at(1))["url"]
    %{id: t["id"], name: t["name"], artist: artist, image: image, url: t["external_urls"]["spotify"]}
  end

  def edit(conn, %{"id" => id}) do
    playlist = Playlists.get_playlist!(id)
    changeset = Playlists.change_playlist(playlist)
    render(conn, "edit.html", playlist: playlist, changeset: changeset)
  end

  def update(conn, %{"id" => id, "playlist" => playlist_params}) do
    playlist = Playlists.get_playlist!(id)

    case Playlists.update_playlist(playlist, playlist_params) do
      {:ok, playlist} ->
        conn
        |> put_flash(:info, "Playlist updated successfully.")
        |> redirect(to: Routes.playlist_path(conn, :show, playlist))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", playlist: playlist, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    playlist = Playlists.get_playlist!(id)
    {:ok, _playlist} = Playlists.delete_playlist(playlist)

    conn
    |> put_flash(:info, "Playlist deleted successfully.")
    |> redirect(to: Routes.playlist_path(conn, :index))
  end
end
