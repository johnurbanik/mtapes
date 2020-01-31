defmodule Mtapes.Prompts do
  @moduledoc """
  The Prompts context.
  """

  import Ecto.Query, warn: false
  alias Mtapes.Repo

  alias Mtapes.Prompts.Prompt

  @doc """
  Returns the list of prompts.

  ## Examples

      iex> list_prompts()
      [%Prompt{}, ...]

  """
  def list_prompts do
    Repo.all(Prompt)
  end

  @doc """
  Gets a single prompt.

  Raises `Ecto.NoResultsError` if the Prompt does not exist.

  ## Examples

      iex> get_prompt!(123)
      %Prompt{}

      iex> get_prompt!(456)
      ** (Ecto.NoResultsError)

  """
  def get_prompt!(id), do: Repo.get!(Prompt, id)

  @doc """
  Creates a prompt.

  ## Examples

      iex> create_prompt(%{field: value})
      {:ok, %Prompt{}}

      iex> create_prompt(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_prompt(attrs \\ %{}) do
    %Prompt{}
    |> Prompt.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a prompt.

  ## Examples

      iex> update_prompt(prompt, %{field: new_value})
      {:ok, %Prompt{}}

      iex> update_prompt(prompt, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_prompt(%Prompt{} = prompt, attrs) do
    prompt
    |> Prompt.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Prompt.

  ## Examples

      iex> delete_prompt(prompt)
      {:ok, %Prompt{}}

      iex> delete_prompt(prompt)
      {:error, %Ecto.Changeset{}}

  """
  def delete_prompt(%Prompt{} = prompt) do
    Repo.delete(prompt)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking prompt changes.

  ## Examples

      iex> change_prompt(prompt)
      %Ecto.Changeset{source: %Prompt{}}

  """
  def change_prompt(%Prompt{} = prompt) do
    Prompt.changeset(prompt, %{})
  end

  alias Mtapes.Prompts.PromptPlaylist

  @doc """
  Returns the list of prompts_playlists.

  ## Examples

      iex> list_prompts_playlists()
      [%PromptPlaylist{}, ...]

  """
  def list_prompts_playlists do
    Repo.all(PromptPlaylist)
  end

  @doc """
  Gets a single prompt_playlist.

  Raises `Ecto.NoResultsError` if the Prompt playlist does not exist.

  ## Examples

      iex> get_prompt_playlist!(123)
      %PromptPlaylist{}

      iex> get_prompt_playlist!(456)
      ** (Ecto.NoResultsError)

  """
  def get_prompt_playlist!(id), do: Repo.get!(PromptPlaylist, id)

  @doc """
  Creates a prompt_playlist.

  ## Examples

      iex> create_prompt_playlist(%{field: value})
      {:ok, %PromptPlaylist{}}

      iex> create_prompt_playlist(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_prompt_playlist(attrs \\ %{}) do
    %PromptPlaylist{}
    |> PromptPlaylist.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a prompt_playlist.

  ## Examples

      iex> update_prompt_playlist(prompt_playlist, %{field: new_value})
      {:ok, %PromptPlaylist{}}

      iex> update_prompt_playlist(prompt_playlist, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_prompt_playlist(%PromptPlaylist{} = prompt_playlist, attrs) do
    prompt_playlist
    |> PromptPlaylist.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a PromptPlaylist.

  ## Examples

      iex> delete_prompt_playlist(prompt_playlist)
      {:ok, %PromptPlaylist{}}

      iex> delete_prompt_playlist(prompt_playlist)
      {:error, %Ecto.Changeset{}}

  """
  def delete_prompt_playlist(%PromptPlaylist{} = prompt_playlist) do
    Repo.delete(prompt_playlist)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking prompt_playlist changes.

  ## Examples

      iex> change_prompt_playlist(prompt_playlist)
      %Ecto.Changeset{source: %PromptPlaylist{}}

  """
  def change_prompt_playlist(%PromptPlaylist{} = prompt_playlist) do
    PromptPlaylist.changeset(prompt_playlist, %{})
  end
end
