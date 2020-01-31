defmodule Mtapes.Votes do
  @moduledoc """
  The Votes context.
  """

  import Ecto.Query, warn: false
  alias Mtapes.Repo

  alias Mtapes.Votes.PromptVote

  @doc """
  Returns the list of prompt_votes.

  ## Examples

      iex> list_prompt_votes()
      [%PromptVote{}, ...]

  """
  def list_prompt_votes do
    Repo.all(PromptVote)
  end

  @doc """
  Gets a single prompt_vote.

  Raises `Ecto.NoResultsError` if the Prompt vote does not exist.

  ## Examples

      iex> get_prompt_vote!(123)
      %PromptVote{}

      iex> get_prompt_vote!(456)
      ** (Ecto.NoResultsError)

  """
  def get_prompt_vote!(id), do: Repo.get!(PromptVote, id)

  @doc """
  Creates a prompt_vote.

  ## Examples

      iex> create_prompt_vote(%{field: value})
      {:ok, %PromptVote{}}

      iex> create_prompt_vote(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_prompt_vote(attrs \\ %{}) do
    %PromptVote{}
    |> PromptVote.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a prompt_vote.

  ## Examples

      iex> update_prompt_vote(prompt_vote, %{field: new_value})
      {:ok, %PromptVote{}}

      iex> update_prompt_vote(prompt_vote, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_prompt_vote(%PromptVote{} = prompt_vote, attrs) do
    prompt_vote
    |> PromptVote.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a PromptVote.

  ## Examples

      iex> delete_prompt_vote(prompt_vote)
      {:ok, %PromptVote{}}

      iex> delete_prompt_vote(prompt_vote)
      {:error, %Ecto.Changeset{}}

  """
  def delete_prompt_vote(%PromptVote{} = prompt_vote) do
    Repo.delete(prompt_vote)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking prompt_vote changes.

  ## Examples

      iex> change_prompt_vote(prompt_vote)
      %Ecto.Changeset{source: %PromptVote{}}

  """
  def change_prompt_vote(%PromptVote{} = prompt_vote) do
    PromptVote.changeset(prompt_vote, %{})
  end

  alias Mtapes.Votes.PlaylistVote

  @doc """
  Returns the list of playlist_votes.

  ## Examples

      iex> list_playlist_votes()
      [%PlaylistVote{}, ...]

  """
  def list_playlist_votes do
    Repo.all(PlaylistVote)
  end

  @doc """
  Gets a single playlist_vote.

  Raises `Ecto.NoResultsError` if the Playlist vote does not exist.

  ## Examples

      iex> get_playlist_vote!(123)
      %PlaylistVote{}

      iex> get_playlist_vote!(456)
      ** (Ecto.NoResultsError)

  """
  def get_playlist_vote!(id), do: Repo.get!(PlaylistVote, id)

  @doc """
  Creates a playlist_vote.

  ## Examples

      iex> create_playlist_vote(%{field: value})
      {:ok, %PlaylistVote{}}

      iex> create_playlist_vote(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_playlist_vote(attrs \\ %{}) do
    %PlaylistVote{}
    |> PlaylistVote.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a playlist_vote.

  ## Examples

      iex> update_playlist_vote(playlist_vote, %{field: new_value})
      {:ok, %PlaylistVote{}}

      iex> update_playlist_vote(playlist_vote, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_playlist_vote(%PlaylistVote{} = playlist_vote, attrs) do
    playlist_vote
    |> PlaylistVote.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a PlaylistVote.

  ## Examples

      iex> delete_playlist_vote(playlist_vote)
      {:ok, %PlaylistVote{}}

      iex> delete_playlist_vote(playlist_vote)
      {:error, %Ecto.Changeset{}}

  """
  def delete_playlist_vote(%PlaylistVote{} = playlist_vote) do
    Repo.delete(playlist_vote)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking playlist_vote changes.

  ## Examples

      iex> change_playlist_vote(playlist_vote)
      %Ecto.Changeset{source: %PlaylistVote{}}

  """
  def change_playlist_vote(%PlaylistVote{} = playlist_vote) do
    PlaylistVote.changeset(playlist_vote, %{})
  end
end
