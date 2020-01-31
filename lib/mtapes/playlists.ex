defmodule Mtapes.Playlists do
  @moduledoc """
  The Playlists context.
  """

  import Ecto.Query, warn: false
  alias Mtapes.Repo

  alias Mtapes.Playlists.Playlist

  @doc """
  Returns the list of playlist.

  ## Examples

      iex> list_playlist()
      [%Playlist{}, ...]

  """
  def list_playlist do
    Repo.all(Playlist)
  end

  @doc """
  Gets a single playlist.

  Raises `Ecto.NoResultsError` if the Playlist does not exist.

  ## Examples

      iex> get_playlist!(123)
      %Playlist{}

      iex> get_playlist!(456)
      ** (Ecto.NoResultsError)

  """
  def get_playlist!(id), do: Repo.get!(Playlist, id)

  @doc """
  Creates a playlist.

  ## Examples

      iex> create_playlist(%{field: value})
      {:ok, %Playlist{}}

      iex> create_playlist(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_playlist(attrs \\ %{}) do
    %Playlist{}
    |> Playlist.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a playlist.

  ## Examples

      iex> update_playlist(playlist, %{field: new_value})
      {:ok, %Playlist{}}

      iex> update_playlist(playlist, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_playlist(%Playlist{} = playlist, attrs) do
    playlist
    |> Playlist.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Playlist.

  ## Examples

      iex> delete_playlist(playlist)
      {:ok, %Playlist{}}

      iex> delete_playlist(playlist)
      {:error, %Ecto.Changeset{}}

  """
  def delete_playlist(%Playlist{} = playlist) do
    Repo.delete(playlist)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking playlist changes.

  ## Examples

      iex> change_playlist(playlist)
      %Ecto.Changeset{source: %Playlist{}}

  """
  def change_playlist(%Playlist{} = playlist) do
    Playlist.changeset(playlist, %{})
  end

  alias Mtapes.Playlists.Song

  @doc """
  Returns the list of songs.

  ## Examples

      iex> list_songs()
      [%Song{}, ...]

  """
  def list_songs do
    Repo.all(Song)
  end

  @doc """
  Gets a single song.

  Raises `Ecto.NoResultsError` if the Song does not exist.

  ## Examples

      iex> get_song!(123)
      %Song{}

      iex> get_song!(456)
      ** (Ecto.NoResultsError)

  """
  def get_song!(id), do: Repo.get!(Song, id)

  @doc """
  Creates a song.

  ## Examples

      iex> create_song(%{field: value})
      {:ok, %Song{}}

      iex> create_song(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_song(attrs \\ %{}) do
    %Song{}
    |> Song.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a song.

  ## Examples

      iex> update_song(song, %{field: new_value})
      {:ok, %Song{}}

      iex> update_song(song, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_song(%Song{} = song, attrs) do
    song
    |> Song.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Song.

  ## Examples

      iex> delete_song(song)
      {:ok, %Song{}}

      iex> delete_song(song)
      {:error, %Ecto.Changeset{}}

  """
  def delete_song(%Song{} = song) do
    Repo.delete(song)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking song changes.

  ## Examples

      iex> change_song(song)
      %Ecto.Changeset{source: %Song{}}

  """
  def change_song(%Song{} = song) do
    Song.changeset(song, %{})
  end
end
