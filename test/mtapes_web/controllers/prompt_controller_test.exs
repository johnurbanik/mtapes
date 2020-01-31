defmodule MtapesWeb.PromptControllerTest do
  use MtapesWeb.ConnCase

  alias Mtapes.Prompts

  @create_attrs %{accepting_submissions: true, body: "some body", image: "some image", title: "some title", weight: 120.5}
  @update_attrs %{accepting_submissions: false, body: "some updated body", image: "some updated image", title: "some updated title", weight: 456.7}
  @invalid_attrs %{accepting_submissions: nil, body: nil, image: nil, title: nil, weight: nil}

  def fixture(:prompt) do
    {:ok, prompt} = Prompts.create_prompt(@create_attrs)
    prompt
  end

  describe "index" do
    test "lists all prompts", %{conn: conn} do
      conn = get(conn, Routes.prompt_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Prompts"
    end
  end

  describe "new prompt" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.prompt_path(conn, :new))
      assert html_response(conn, 200) =~ "New Prompt"
    end
  end

  describe "create prompt" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.prompt_path(conn, :create), prompt: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.prompt_path(conn, :show, id)

      conn = get(conn, Routes.prompt_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Prompt"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.prompt_path(conn, :create), prompt: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Prompt"
    end
  end

  describe "edit prompt" do
    setup [:create_prompt]

    test "renders form for editing chosen prompt", %{conn: conn, prompt: prompt} do
      conn = get(conn, Routes.prompt_path(conn, :edit, prompt))
      assert html_response(conn, 200) =~ "Edit Prompt"
    end
  end

  describe "update prompt" do
    setup [:create_prompt]

    test "redirects when data is valid", %{conn: conn, prompt: prompt} do
      conn = put(conn, Routes.prompt_path(conn, :update, prompt), prompt: @update_attrs)
      assert redirected_to(conn) == Routes.prompt_path(conn, :show, prompt)

      conn = get(conn, Routes.prompt_path(conn, :show, prompt))
      assert html_response(conn, 200) =~ "some updated body"
    end

    test "renders errors when data is invalid", %{conn: conn, prompt: prompt} do
      conn = put(conn, Routes.prompt_path(conn, :update, prompt), prompt: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Prompt"
    end
  end

  describe "delete prompt" do
    setup [:create_prompt]

    test "deletes chosen prompt", %{conn: conn, prompt: prompt} do
      conn = delete(conn, Routes.prompt_path(conn, :delete, prompt))
      assert redirected_to(conn) == Routes.prompt_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.prompt_path(conn, :show, prompt))
      end
    end
  end

  defp create_prompt(_) do
    prompt = fixture(:prompt)
    {:ok, prompt: prompt}
  end
end
