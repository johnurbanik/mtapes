defmodule MtapesWeb.PlaylistSongController do
  use MtapesWeb, :controller

  alias Mtapes.Playlists
  alias Mtapes.Playlists.PlaylistSong

  def index(conn, _params) do
    playlists_songs = Playlists.list_playlists_songs()
    render(conn, "index.html", playlists_songs: playlists_songs)
  end

  def new(conn, _params) do
    changeset = Playlists.change_playlist_song(%PlaylistSong{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"playlist_song" => playlist_song_params}) do
    case Playlists.create_playlist_song(playlist_song_params) do
      {:ok, playlist_song} ->
        conn
        |> put_flash(:info, "Playlist song created successfully.")
        |> redirect(to: Routes.playlist_song_path(conn, :show, playlist_song))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    playlist_song = Playlists.get_playlist_song!(id)
    render(conn, "show.html", playlist_song: playlist_song)
  end

  def edit(conn, %{"id" => id}) do
    playlist_song = Playlists.get_playlist_song!(id)
    changeset = Playlists.change_playlist_song(playlist_song)
    render(conn, "edit.html", playlist_song: playlist_song, changeset: changeset)
  end

  def update(conn, %{"id" => id, "playlist_song" => playlist_song_params}) do
    playlist_song = Playlists.get_playlist_song!(id)

    case Playlists.update_playlist_song(playlist_song, playlist_song_params) do
      {:ok, playlist_song} ->
        conn
        |> put_flash(:info, "Playlist song updated successfully.")
        |> redirect(to: Routes.playlist_song_path(conn, :show, playlist_song))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", playlist_song: playlist_song, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    playlist_song = Playlists.get_playlist_song!(id)
    {:ok, _playlist_song} = Playlists.delete_playlist_song(playlist_song)

    conn
    |> put_flash(:info, "Playlist song deleted successfully.")
    |> redirect(to: Routes.playlist_song_path(conn, :index))
  end
end
