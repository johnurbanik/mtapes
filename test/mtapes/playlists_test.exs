defmodule Mtapes.PlaylistsTest do
  use Mtapes.DataCase

  alias Mtapes.Playlists

  describe "playlist" do
    alias Mtapes.Playlists.Playlist

    @valid_attrs %{description: "some description", name: "some name", spotify_id: "some spotify_id"}
    @update_attrs %{description: "some updated description", name: "some updated name", spotify_id: "some updated spotify_id"}
    @invalid_attrs %{description: nil, name: nil, spotify_id: nil}

    def playlist_fixture(attrs \\ %{}) do
      {:ok, playlist} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Playlists.create_playlist()

      playlist
    end

    test "list_playlist/0 returns all playlist" do
      playlist = playlist_fixture()
      assert Playlists.list_playlist() == [playlist]
    end

    test "get_playlist!/1 returns the playlist with given id" do
      playlist = playlist_fixture()
      assert Playlists.get_playlist!(playlist.id) == playlist
    end

    test "create_playlist/1 with valid data creates a playlist" do
      assert {:ok, %Playlist{} = playlist} = Playlists.create_playlist(@valid_attrs)
      assert playlist.description == "some description"
      assert playlist.name == "some name"
      assert playlist.spotify_id == "some spotify_id"
    end

    test "create_playlist/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Playlists.create_playlist(@invalid_attrs)
    end

    test "update_playlist/2 with valid data updates the playlist" do
      playlist = playlist_fixture()
      assert {:ok, %Playlist{} = playlist} = Playlists.update_playlist(playlist, @update_attrs)
      assert playlist.description == "some updated description"
      assert playlist.name == "some updated name"
      assert playlist.spotify_id == "some updated spotify_id"
    end

    test "update_playlist/2 with invalid data returns error changeset" do
      playlist = playlist_fixture()
      assert {:error, %Ecto.Changeset{}} = Playlists.update_playlist(playlist, @invalid_attrs)
      assert playlist == Playlists.get_playlist!(playlist.id)
    end

    test "delete_playlist/1 deletes the playlist" do
      playlist = playlist_fixture()
      assert {:ok, %Playlist{}} = Playlists.delete_playlist(playlist)
      assert_raise Ecto.NoResultsError, fn -> Playlists.get_playlist!(playlist.id) end
    end

    test "change_playlist/1 returns a playlist changeset" do
      playlist = playlist_fixture()
      assert %Ecto.Changeset{} = Playlists.change_playlist(playlist)
    end
  end

  describe "songs" do
    alias Mtapes.Playlists.Song

    @valid_attrs %{artist: "some artist", name: "some name"}
    @update_attrs %{artist: "some updated artist", name: "some updated name"}
    @invalid_attrs %{artist: nil, name: nil}

    def song_fixture(attrs \\ %{}) do
      {:ok, song} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Playlists.create_song()

      song
    end

    test "list_songs/0 returns all songs" do
      song = song_fixture()
      assert Playlists.list_songs() == [song]
    end

    test "get_song!/1 returns the song with given id" do
      song = song_fixture()
      assert Playlists.get_song!(song.id) == song
    end

    test "create_song/1 with valid data creates a song" do
      assert {:ok, %Song{} = song} = Playlists.create_song(@valid_attrs)
      assert song.artist == "some artist"
      assert song.name == "some name"
    end

    test "create_song/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Playlists.create_song(@invalid_attrs)
    end

    test "update_song/2 with valid data updates the song" do
      song = song_fixture()
      assert {:ok, %Song{} = song} = Playlists.update_song(song, @update_attrs)
      assert song.artist == "some updated artist"
      assert song.name == "some updated name"
    end

    test "update_song/2 with invalid data returns error changeset" do
      song = song_fixture()
      assert {:error, %Ecto.Changeset{}} = Playlists.update_song(song, @invalid_attrs)
      assert song == Playlists.get_song!(song.id)
    end

    test "delete_song/1 deletes the song" do
      song = song_fixture()
      assert {:ok, %Song{}} = Playlists.delete_song(song)
      assert_raise Ecto.NoResultsError, fn -> Playlists.get_song!(song.id) end
    end

    test "change_song/1 returns a song changeset" do
      song = song_fixture()
      assert %Ecto.Changeset{} = Playlists.change_song(song)
    end
  end

  describe "playlists_songs" do
    alias Mtapes.Playlists.PlaylistSong

    @valid_attrs %{}
    @update_attrs %{}
    @invalid_attrs %{}

    def playlist_song_fixture(attrs \\ %{}) do
      {:ok, playlist_song} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Playlists.create_playlist_song()

      playlist_song
    end

    test "list_playlists_songs/0 returns all playlists_songs" do
      playlist_song = playlist_song_fixture()
      assert Playlists.list_playlists_songs() == [playlist_song]
    end

    test "get_playlist_song!/1 returns the playlist_song with given id" do
      playlist_song = playlist_song_fixture()
      assert Playlists.get_playlist_song!(playlist_song.id) == playlist_song
    end

    test "create_playlist_song/1 with valid data creates a playlist_song" do
      assert {:ok, %PlaylistSong{} = playlist_song} = Playlists.create_playlist_song(@valid_attrs)
    end

    test "create_playlist_song/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Playlists.create_playlist_song(@invalid_attrs)
    end

    test "update_playlist_song/2 with valid data updates the playlist_song" do
      playlist_song = playlist_song_fixture()
      assert {:ok, %PlaylistSong{} = playlist_song} = Playlists.update_playlist_song(playlist_song, @update_attrs)
    end

    test "update_playlist_song/2 with invalid data returns error changeset" do
      playlist_song = playlist_song_fixture()
      assert {:error, %Ecto.Changeset{}} = Playlists.update_playlist_song(playlist_song, @invalid_attrs)
      assert playlist_song == Playlists.get_playlist_song!(playlist_song.id)
    end

    test "delete_playlist_song/1 deletes the playlist_song" do
      playlist_song = playlist_song_fixture()
      assert {:ok, %PlaylistSong{}} = Playlists.delete_playlist_song(playlist_song)
      assert_raise Ecto.NoResultsError, fn -> Playlists.get_playlist_song!(playlist_song.id) end
    end

    test "change_playlist_song/1 returns a playlist_song changeset" do
      playlist_song = playlist_song_fixture()
      assert %Ecto.Changeset{} = Playlists.change_playlist_song(playlist_song)
    end
  end
end
