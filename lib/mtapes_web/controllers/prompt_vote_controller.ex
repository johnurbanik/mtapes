defmodule MtapesWeb.PromptVoteController do
  use MtapesWeb, :controller

  alias Mtapes.Votes
  alias Mtapes.Votes.PromptVote

  def index(conn, _params) do
    prompt_votes = Votes.list_prompt_votes()
    render(conn, "index.html", prompt_votes: prompt_votes)
  end

  def new(conn, _params) do
    changeset = Votes.change_prompt_vote(%PromptVote{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"prompt_vote" => prompt_vote_params}) do
    case Votes.create_prompt_vote(prompt_vote_params) do
      {:ok, prompt_vote} ->
        conn
        |> put_flash(:info, "Prompt vote created successfully.")
        |> redirect(to: Routes.prompt_vote_path(conn, :show, prompt_vote))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    prompt_vote = Votes.get_prompt_vote!(id)
    render(conn, "show.html", prompt_vote: prompt_vote)
  end

  def edit(conn, %{"id" => id}) do
    prompt_vote = Votes.get_prompt_vote!(id)
    changeset = Votes.change_prompt_vote(prompt_vote)
    render(conn, "edit.html", prompt_vote: prompt_vote, changeset: changeset)
  end

  def update(conn, %{"id" => id, "prompt_vote" => prompt_vote_params}) do
    prompt_vote = Votes.get_prompt_vote!(id)

    case Votes.update_prompt_vote(prompt_vote, prompt_vote_params) do
      {:ok, prompt_vote} ->
        conn
        |> put_flash(:info, "Prompt vote updated successfully.")
        |> redirect(to: Routes.prompt_vote_path(conn, :show, prompt_vote))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", prompt_vote: prompt_vote, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    prompt_vote = Votes.get_prompt_vote!(id)
    {:ok, _prompt_vote} = Votes.delete_prompt_vote(prompt_vote)

    conn
    |> put_flash(:info, "Prompt vote deleted successfully.")
    |> redirect(to: Routes.prompt_vote_path(conn, :index))
  end
end
