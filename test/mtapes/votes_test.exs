defmodule Mtapes.VotesTest do
  use Mtapes.DataCase

  alias Mtapes.Votes

  describe "prompt_votes" do
    alias Mtapes.Votes.PromptVote

    @valid_attrs %{}
    @update_attrs %{}
    @invalid_attrs %{}

    def prompt_vote_fixture(attrs \\ %{}) do
      {:ok, prompt_vote} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Votes.create_prompt_vote()

      prompt_vote
    end

    test "list_prompt_votes/0 returns all prompt_votes" do
      prompt_vote = prompt_vote_fixture()
      assert Votes.list_prompt_votes() == [prompt_vote]
    end

    test "get_prompt_vote!/1 returns the prompt_vote with given id" do
      prompt_vote = prompt_vote_fixture()
      assert Votes.get_prompt_vote!(prompt_vote.id) == prompt_vote
    end

    test "create_prompt_vote/1 with valid data creates a prompt_vote" do
      assert {:ok, %PromptVote{} = prompt_vote} = Votes.create_prompt_vote(@valid_attrs)
    end

    test "create_prompt_vote/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Votes.create_prompt_vote(@invalid_attrs)
    end

    test "update_prompt_vote/2 with valid data updates the prompt_vote" do
      prompt_vote = prompt_vote_fixture()
      assert {:ok, %PromptVote{} = prompt_vote} = Votes.update_prompt_vote(prompt_vote, @update_attrs)
    end

    test "update_prompt_vote/2 with invalid data returns error changeset" do
      prompt_vote = prompt_vote_fixture()
      assert {:error, %Ecto.Changeset{}} = Votes.update_prompt_vote(prompt_vote, @invalid_attrs)
      assert prompt_vote == Votes.get_prompt_vote!(prompt_vote.id)
    end

    test "delete_prompt_vote/1 deletes the prompt_vote" do
      prompt_vote = prompt_vote_fixture()
      assert {:ok, %PromptVote{}} = Votes.delete_prompt_vote(prompt_vote)
      assert_raise Ecto.NoResultsError, fn -> Votes.get_prompt_vote!(prompt_vote.id) end
    end

    test "change_prompt_vote/1 returns a prompt_vote changeset" do
      prompt_vote = prompt_vote_fixture()
      assert %Ecto.Changeset{} = Votes.change_prompt_vote(prompt_vote)
    end
  end

  describe "prompt_votes" do
    alias Mtapes.Votes.PromptVote

    @valid_attrs %{direction: "some direction"}
    @update_attrs %{direction: "some updated direction"}
    @invalid_attrs %{direction: nil}

    def prompt_vote_fixture(attrs \\ %{}) do
      {:ok, prompt_vote} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Votes.create_prompt_vote()

      prompt_vote
    end

    test "list_prompt_votes/0 returns all prompt_votes" do
      prompt_vote = prompt_vote_fixture()
      assert Votes.list_prompt_votes() == [prompt_vote]
    end

    test "get_prompt_vote!/1 returns the prompt_vote with given id" do
      prompt_vote = prompt_vote_fixture()
      assert Votes.get_prompt_vote!(prompt_vote.id) == prompt_vote
    end

    test "create_prompt_vote/1 with valid data creates a prompt_vote" do
      assert {:ok, %PromptVote{} = prompt_vote} = Votes.create_prompt_vote(@valid_attrs)
      assert prompt_vote.direction == "some direction"
    end

    test "create_prompt_vote/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Votes.create_prompt_vote(@invalid_attrs)
    end

    test "update_prompt_vote/2 with valid data updates the prompt_vote" do
      prompt_vote = prompt_vote_fixture()
      assert {:ok, %PromptVote{} = prompt_vote} = Votes.update_prompt_vote(prompt_vote, @update_attrs)
      assert prompt_vote.direction == "some updated direction"
    end

    test "update_prompt_vote/2 with invalid data returns error changeset" do
      prompt_vote = prompt_vote_fixture()
      assert {:error, %Ecto.Changeset{}} = Votes.update_prompt_vote(prompt_vote, @invalid_attrs)
      assert prompt_vote == Votes.get_prompt_vote!(prompt_vote.id)
    end

    test "delete_prompt_vote/1 deletes the prompt_vote" do
      prompt_vote = prompt_vote_fixture()
      assert {:ok, %PromptVote{}} = Votes.delete_prompt_vote(prompt_vote)
      assert_raise Ecto.NoResultsError, fn -> Votes.get_prompt_vote!(prompt_vote.id) end
    end

    test "change_prompt_vote/1 returns a prompt_vote changeset" do
      prompt_vote = prompt_vote_fixture()
      assert %Ecto.Changeset{} = Votes.change_prompt_vote(prompt_vote)
    end
  end

  describe "playlist_votes" do
    alias Mtapes.Votes.PlaylistVote

    @valid_attrs %{direction: 42}
    @update_attrs %{direction: 43}
    @invalid_attrs %{direction: nil}

    def playlist_vote_fixture(attrs \\ %{}) do
      {:ok, playlist_vote} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Votes.create_playlist_vote()

      playlist_vote
    end

    test "list_playlist_votes/0 returns all playlist_votes" do
      playlist_vote = playlist_vote_fixture()
      assert Votes.list_playlist_votes() == [playlist_vote]
    end

    test "get_playlist_vote!/1 returns the playlist_vote with given id" do
      playlist_vote = playlist_vote_fixture()
      assert Votes.get_playlist_vote!(playlist_vote.id) == playlist_vote
    end

    test "create_playlist_vote/1 with valid data creates a playlist_vote" do
      assert {:ok, %PlaylistVote{} = playlist_vote} = Votes.create_playlist_vote(@valid_attrs)
      assert playlist_vote.direction == 42
    end

    test "create_playlist_vote/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Votes.create_playlist_vote(@invalid_attrs)
    end

    test "update_playlist_vote/2 with valid data updates the playlist_vote" do
      playlist_vote = playlist_vote_fixture()
      assert {:ok, %PlaylistVote{} = playlist_vote} = Votes.update_playlist_vote(playlist_vote, @update_attrs)
      assert playlist_vote.direction == 43
    end

    test "update_playlist_vote/2 with invalid data returns error changeset" do
      playlist_vote = playlist_vote_fixture()
      assert {:error, %Ecto.Changeset{}} = Votes.update_playlist_vote(playlist_vote, @invalid_attrs)
      assert playlist_vote == Votes.get_playlist_vote!(playlist_vote.id)
    end

    test "delete_playlist_vote/1 deletes the playlist_vote" do
      playlist_vote = playlist_vote_fixture()
      assert {:ok, %PlaylistVote{}} = Votes.delete_playlist_vote(playlist_vote)
      assert_raise Ecto.NoResultsError, fn -> Votes.get_playlist_vote!(playlist_vote.id) end
    end

    test "change_playlist_vote/1 returns a playlist_vote changeset" do
      playlist_vote = playlist_vote_fixture()
      assert %Ecto.Changeset{} = Votes.change_playlist_vote(playlist_vote)
    end
  end
end
