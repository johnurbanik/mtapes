defmodule MtapesWeb.PromptPlaylistControllerTest do
  use MtapesWeb.ConnCase

  alias Mtapes.Prompts

  @create_attrs %{}
  @update_attrs %{}
  @invalid_attrs %{}

  def fixture(:prompt_playlist) do
    {:ok, prompt_playlist} = Prompts.create_prompt_playlist(@create_attrs)
    prompt_playlist
  end

  describe "index" do
    test "lists all prompts_playlists", %{conn: conn} do
      conn = get(conn, Routes.prompt_playlist_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Prompts playlists"
    end
  end

  describe "new prompt_playlist" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.prompt_playlist_path(conn, :new))
      assert html_response(conn, 200) =~ "New Prompt playlist"
    end
  end

  describe "create prompt_playlist" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.prompt_playlist_path(conn, :create), prompt_playlist: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.prompt_playlist_path(conn, :show, id)

      conn = get(conn, Routes.prompt_playlist_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Prompt playlist"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.prompt_playlist_path(conn, :create), prompt_playlist: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Prompt playlist"
    end
  end

  describe "edit prompt_playlist" do
    setup [:create_prompt_playlist]

    test "renders form for editing chosen prompt_playlist", %{conn: conn, prompt_playlist: prompt_playlist} do
      conn = get(conn, Routes.prompt_playlist_path(conn, :edit, prompt_playlist))
      assert html_response(conn, 200) =~ "Edit Prompt playlist"
    end
  end

  describe "update prompt_playlist" do
    setup [:create_prompt_playlist]

    test "redirects when data is valid", %{conn: conn, prompt_playlist: prompt_playlist} do
      conn = put(conn, Routes.prompt_playlist_path(conn, :update, prompt_playlist), prompt_playlist: @update_attrs)
      assert redirected_to(conn) == Routes.prompt_playlist_path(conn, :show, prompt_playlist)

      conn = get(conn, Routes.prompt_playlist_path(conn, :show, prompt_playlist))
      assert html_response(conn, 200)
    end

    test "renders errors when data is invalid", %{conn: conn, prompt_playlist: prompt_playlist} do
      conn = put(conn, Routes.prompt_playlist_path(conn, :update, prompt_playlist), prompt_playlist: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Prompt playlist"
    end
  end

  describe "delete prompt_playlist" do
    setup [:create_prompt_playlist]

    test "deletes chosen prompt_playlist", %{conn: conn, prompt_playlist: prompt_playlist} do
      conn = delete(conn, Routes.prompt_playlist_path(conn, :delete, prompt_playlist))
      assert redirected_to(conn) == Routes.prompt_playlist_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.prompt_playlist_path(conn, :show, prompt_playlist))
      end
    end
  end

  defp create_prompt_playlist(_) do
    prompt_playlist = fixture(:prompt_playlist)
    {:ok, prompt_playlist: prompt_playlist}
  end
end
