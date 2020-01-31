defmodule MtapesWeb.PlaylistController do
  use MtapesWeb, :controller

  alias Mtapes.Playlists
  alias Mtapes.Playlists.Playlist

  def index(conn, _params) do
    playlist = Playlists.list_playlist()
    render(conn, "index.html", playlist: playlist)
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
    render(conn, "show.html", playlist: playlist)
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
