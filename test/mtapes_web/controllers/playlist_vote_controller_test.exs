defmodule MtapesWeb.PlaylistVoteControllerTest do
  use MtapesWeb.ConnCase

  alias Mtapes.Votes

  @create_attrs %{direction: 42}
  @update_attrs %{direction: 43}
  @invalid_attrs %{direction: nil}

  def fixture(:playlist_vote) do
    {:ok, playlist_vote} = Votes.create_playlist_vote(@create_attrs)
    playlist_vote
  end

  describe "index" do
    test "lists all playlist_votes", %{conn: conn} do
      conn = get(conn, Routes.playlist_vote_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Playlist votes"
    end
  end

  describe "new playlist_vote" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.playlist_vote_path(conn, :new))
      assert html_response(conn, 200) =~ "New Playlist vote"
    end
  end

  describe "create playlist_vote" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.playlist_vote_path(conn, :create), playlist_vote: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.playlist_vote_path(conn, :show, id)

      conn = get(conn, Routes.playlist_vote_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Playlist vote"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.playlist_vote_path(conn, :create), playlist_vote: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Playlist vote"
    end
  end

  describe "edit playlist_vote" do
    setup [:create_playlist_vote]

    test "renders form for editing chosen playlist_vote", %{conn: conn, playlist_vote: playlist_vote} do
      conn = get(conn, Routes.playlist_vote_path(conn, :edit, playlist_vote))
      assert html_response(conn, 200) =~ "Edit Playlist vote"
    end
  end

  describe "update playlist_vote" do
    setup [:create_playlist_vote]

    test "redirects when data is valid", %{conn: conn, playlist_vote: playlist_vote} do
      conn = put(conn, Routes.playlist_vote_path(conn, :update, playlist_vote), playlist_vote: @update_attrs)
      assert redirected_to(conn) == Routes.playlist_vote_path(conn, :show, playlist_vote)

      conn = get(conn, Routes.playlist_vote_path(conn, :show, playlist_vote))
      assert html_response(conn, 200)
    end

    test "renders errors when data is invalid", %{conn: conn, playlist_vote: playlist_vote} do
      conn = put(conn, Routes.playlist_vote_path(conn, :update, playlist_vote), playlist_vote: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Playlist vote"
    end
  end

  describe "delete playlist_vote" do
    setup [:create_playlist_vote]

    test "deletes chosen playlist_vote", %{conn: conn, playlist_vote: playlist_vote} do
      conn = delete(conn, Routes.playlist_vote_path(conn, :delete, playlist_vote))
      assert redirected_to(conn) == Routes.playlist_vote_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.playlist_vote_path(conn, :show, playlist_vote))
      end
    end
  end

  defp create_playlist_vote(_) do
    playlist_vote = fixture(:playlist_vote)
    {:ok, playlist_vote: playlist_vote}
  end
end
