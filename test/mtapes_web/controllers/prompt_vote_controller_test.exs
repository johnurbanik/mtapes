defmodule MtapesWeb.PromptVoteControllerTest do
  use MtapesWeb.ConnCase

  alias Mtapes.Votes

  @create_attrs %{direction: "some direction"}
  @update_attrs %{direction: "some updated direction"}
  @invalid_attrs %{direction: nil}

  def fixture(:prompt_vote) do
    {:ok, prompt_vote} = Votes.create_prompt_vote(@create_attrs)
    prompt_vote
  end

  describe "index" do
    test "lists all prompt_votes", %{conn: conn} do
      conn = get(conn, Routes.prompt_vote_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Prompt votes"
    end
  end

  describe "new prompt_vote" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.prompt_vote_path(conn, :new))
      assert html_response(conn, 200) =~ "New Prompt vote"
    end
  end

  describe "create prompt_vote" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.prompt_vote_path(conn, :create), prompt_vote: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.prompt_vote_path(conn, :show, id)

      conn = get(conn, Routes.prompt_vote_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Prompt vote"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.prompt_vote_path(conn, :create), prompt_vote: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Prompt vote"
    end
  end

  describe "edit prompt_vote" do
    setup [:create_prompt_vote]

    test "renders form for editing chosen prompt_vote", %{conn: conn, prompt_vote: prompt_vote} do
      conn = get(conn, Routes.prompt_vote_path(conn, :edit, prompt_vote))
      assert html_response(conn, 200) =~ "Edit Prompt vote"
    end
  end

  describe "update prompt_vote" do
    setup [:create_prompt_vote]

    test "redirects when data is valid", %{conn: conn, prompt_vote: prompt_vote} do
      conn = put(conn, Routes.prompt_vote_path(conn, :update, prompt_vote), prompt_vote: @update_attrs)
      assert redirected_to(conn) == Routes.prompt_vote_path(conn, :show, prompt_vote)

      conn = get(conn, Routes.prompt_vote_path(conn, :show, prompt_vote))
      assert html_response(conn, 200) =~ "some updated direction"
    end

    test "renders errors when data is invalid", %{conn: conn, prompt_vote: prompt_vote} do
      conn = put(conn, Routes.prompt_vote_path(conn, :update, prompt_vote), prompt_vote: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Prompt vote"
    end
  end

  describe "delete prompt_vote" do
    setup [:create_prompt_vote]

    test "deletes chosen prompt_vote", %{conn: conn, prompt_vote: prompt_vote} do
      conn = delete(conn, Routes.prompt_vote_path(conn, :delete, prompt_vote))
      assert redirected_to(conn) == Routes.prompt_vote_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.prompt_vote_path(conn, :show, prompt_vote))
      end
    end
  end

  defp create_prompt_vote(_) do
    prompt_vote = fixture(:prompt_vote)
    {:ok, prompt_vote: prompt_vote}
  end
end
