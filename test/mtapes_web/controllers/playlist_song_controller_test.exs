defmodule MtapesWeb.PlaylistSongControllerTest do
  use MtapesWeb.ConnCase

  alias Mtapes.Playlists

  @create_attrs %{}
  @update_attrs %{}
  @invalid_attrs %{}

  def fixture(:playlist_song) do
    {:ok, playlist_song} = Playlists.create_playlist_song(@create_attrs)
    playlist_song
  end

  describe "index" do
    test "lists all playlists_songs", %{conn: conn} do
      conn = get(conn, Routes.playlist_song_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Playlists songs"
    end
  end

  describe "new playlist_song" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.playlist_song_path(conn, :new))
      assert html_response(conn, 200) =~ "New Playlist song"
    end
  end

  describe "create playlist_song" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.playlist_song_path(conn, :create), playlist_song: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.playlist_song_path(conn, :show, id)

      conn = get(conn, Routes.playlist_song_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Playlist song"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.playlist_song_path(conn, :create), playlist_song: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Playlist song"
    end
  end

  describe "edit playlist_song" do
    setup [:create_playlist_song]

    test "renders form for editing chosen playlist_song", %{conn: conn, playlist_song: playlist_song} do
      conn = get(conn, Routes.playlist_song_path(conn, :edit, playlist_song))
      assert html_response(conn, 200) =~ "Edit Playlist song"
    end
  end

  describe "update playlist_song" do
    setup [:create_playlist_song]

    test "redirects when data is valid", %{conn: conn, playlist_song: playlist_song} do
      conn = put(conn, Routes.playlist_song_path(conn, :update, playlist_song), playlist_song: @update_attrs)
      assert redirected_to(conn) == Routes.playlist_song_path(conn, :show, playlist_song)

      conn = get(conn, Routes.playlist_song_path(conn, :show, playlist_song))
      assert html_response(conn, 200)
    end

    test "renders errors when data is invalid", %{conn: conn, playlist_song: playlist_song} do
      conn = put(conn, Routes.playlist_song_path(conn, :update, playlist_song), playlist_song: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Playlist song"
    end
  end

  describe "delete playlist_song" do
    setup [:create_playlist_song]

    test "deletes chosen playlist_song", %{conn: conn, playlist_song: playlist_song} do
      conn = delete(conn, Routes.playlist_song_path(conn, :delete, playlist_song))
      assert redirected_to(conn) == Routes.playlist_song_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.playlist_song_path(conn, :show, playlist_song))
      end
    end
  end

  defp create_playlist_song(_) do
    playlist_song = fixture(:playlist_song)
    {:ok, playlist_song: playlist_song}
  end
end
