defmodule MtapesWeb.PlaylistVoteController do
  use MtapesWeb, :controller

  alias Mtapes.Votes
  alias Mtapes.Votes.PlaylistVote

  def index(conn, _params) do
    playlist_votes = Votes.list_playlist_votes()
    render(conn, "index.html", playlist_votes: playlist_votes)
  end

  def new(conn, _params) do
    changeset = Votes.change_playlist_vote(%PlaylistVote{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"playlist_vote" => playlist_vote_params}) do
    case Votes.create_playlist_vote(playlist_vote_params) do
      {:ok, playlist_vote} ->
        conn
        |> put_flash(:info, "Playlist vote created successfully.")
        |> redirect(to: Routes.playlist_vote_path(conn, :show, playlist_vote))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    playlist_vote = Votes.get_playlist_vote!(id)
    render(conn, "show.html", playlist_vote: playlist_vote)
  end

  def edit(conn, %{"id" => id}) do
    playlist_vote = Votes.get_playlist_vote!(id)
    changeset = Votes.change_playlist_vote(playlist_vote)
    render(conn, "edit.html", playlist_vote: playlist_vote, changeset: changeset)
  end

  def update(conn, %{"id" => id, "playlist_vote" => playlist_vote_params}) do
    playlist_vote = Votes.get_playlist_vote!(id)

    case Votes.update_playlist_vote(playlist_vote, playlist_vote_params) do
      {:ok, playlist_vote} ->
        conn
        |> put_flash(:info, "Playlist vote updated successfully.")
        |> redirect(to: Routes.playlist_vote_path(conn, :show, playlist_vote))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", playlist_vote: playlist_vote, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    playlist_vote = Votes.get_playlist_vote!(id)
    {:ok, _playlist_vote} = Votes.delete_playlist_vote(playlist_vote)

    conn
    |> put_flash(:info, "Playlist vote deleted successfully.")
    |> redirect(to: Routes.playlist_vote_path(conn, :index))
  end
end
