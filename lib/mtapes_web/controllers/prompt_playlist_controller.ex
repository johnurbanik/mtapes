defmodule MtapesWeb.PromptPlaylistController do
  use MtapesWeb, :controller

  alias Mtapes.Prompts
  alias Mtapes.Prompts.PromptPlaylist

  def index(conn, _params) do
    prompts_playlists = Prompts.list_prompts_playlists()
    render(conn, "index.html", prompts_playlists: prompts_playlists)
  end

  def new(conn, _params) do
    changeset = Prompts.change_prompt_playlist(%PromptPlaylist{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"prompt_playlist" => prompt_playlist_params}) do
    case Prompts.create_prompt_playlist(prompt_playlist_params) do
      {:ok, prompt_playlist} ->
        conn
        |> put_flash(:info, "Prompt playlist created successfully.")
        |> redirect(to: Routes.prompt_playlist_path(conn, :show, prompt_playlist))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    prompt_playlist = Prompts.get_prompt_playlist!(id)
    render(conn, "show.html", prompt_playlist: prompt_playlist)
  end

  def edit(conn, %{"id" => id}) do
    prompt_playlist = Prompts.get_prompt_playlist!(id)
    changeset = Prompts.change_prompt_playlist(prompt_playlist)
    render(conn, "edit.html", prompt_playlist: prompt_playlist, changeset: changeset)
  end

  def update(conn, %{"id" => id, "prompt_playlist" => prompt_playlist_params}) do
    prompt_playlist = Prompts.get_prompt_playlist!(id)

    case Prompts.update_prompt_playlist(prompt_playlist, prompt_playlist_params) do
      {:ok, prompt_playlist} ->
        conn
        |> put_flash(:info, "Prompt playlist updated successfully.")
        |> redirect(to: Routes.prompt_playlist_path(conn, :show, prompt_playlist))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", prompt_playlist: prompt_playlist, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    prompt_playlist = Prompts.get_prompt_playlist!(id)
    {:ok, _prompt_playlist} = Prompts.delete_prompt_playlist(prompt_playlist)

    conn
    |> put_flash(:info, "Prompt playlist deleted successfully.")
    |> redirect(to: Routes.prompt_playlist_path(conn, :index))
  end
end
