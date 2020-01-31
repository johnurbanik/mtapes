defmodule Mtapes.PromptsTest do
  use Mtapes.DataCase

  alias Mtapes.Prompts

  describe "prompts" do
    alias Mtapes.Prompts.Prompt

    @valid_attrs %{accepting_submissions: true, body: "some body", image: "some image", title: "some title", weight: 120.5}
    @update_attrs %{accepting_submissions: false, body: "some updated body", image: "some updated image", title: "some updated title", weight: 456.7}
    @invalid_attrs %{accepting_submissions: nil, body: nil, image: nil, title: nil, weight: nil}

    def prompt_fixture(attrs \\ %{}) do
      {:ok, prompt} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Prompts.create_prompt()

      prompt
    end

    test "list_prompts/0 returns all prompts" do
      prompt = prompt_fixture()
      assert Prompts.list_prompts() == [prompt]
    end

    test "get_prompt!/1 returns the prompt with given id" do
      prompt = prompt_fixture()
      assert Prompts.get_prompt!(prompt.id) == prompt
    end

    test "create_prompt/1 with valid data creates a prompt" do
      assert {:ok, %Prompt{} = prompt} = Prompts.create_prompt(@valid_attrs)
      assert prompt.accepting_submissions == true
      assert prompt.body == "some body"
      assert prompt.image == "some image"
      assert prompt.title == "some title"
      assert prompt.weight == 120.5
    end

    test "create_prompt/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Prompts.create_prompt(@invalid_attrs)
    end

    test "update_prompt/2 with valid data updates the prompt" do
      prompt = prompt_fixture()
      assert {:ok, %Prompt{} = prompt} = Prompts.update_prompt(prompt, @update_attrs)
      assert prompt.accepting_submissions == false
      assert prompt.body == "some updated body"
      assert prompt.image == "some updated image"
      assert prompt.title == "some updated title"
      assert prompt.weight == 456.7
    end

    test "update_prompt/2 with invalid data returns error changeset" do
      prompt = prompt_fixture()
      assert {:error, %Ecto.Changeset{}} = Prompts.update_prompt(prompt, @invalid_attrs)
      assert prompt == Prompts.get_prompt!(prompt.id)
    end

    test "delete_prompt/1 deletes the prompt" do
      prompt = prompt_fixture()
      assert {:ok, %Prompt{}} = Prompts.delete_prompt(prompt)
      assert_raise Ecto.NoResultsError, fn -> Prompts.get_prompt!(prompt.id) end
    end

    test "change_prompt/1 returns a prompt changeset" do
      prompt = prompt_fixture()
      assert %Ecto.Changeset{} = Prompts.change_prompt(prompt)
    end
  end

  describe "prompts_playlists" do
    alias Mtapes.Prompts.PromptPlaylist

    @valid_attrs %{}
    @update_attrs %{}
    @invalid_attrs %{}

    def prompt_playlist_fixture(attrs \\ %{}) do
      {:ok, prompt_playlist} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Prompts.create_prompt_playlist()

      prompt_playlist
    end

    test "list_prompts_playlists/0 returns all prompts_playlists" do
      prompt_playlist = prompt_playlist_fixture()
      assert Prompts.list_prompts_playlists() == [prompt_playlist]
    end

    test "get_prompt_playlist!/1 returns the prompt_playlist with given id" do
      prompt_playlist = prompt_playlist_fixture()
      assert Prompts.get_prompt_playlist!(prompt_playlist.id) == prompt_playlist
    end

    test "create_prompt_playlist/1 with valid data creates a prompt_playlist" do
      assert {:ok, %PromptPlaylist{} = prompt_playlist} = Prompts.create_prompt_playlist(@valid_attrs)
    end

    test "create_prompt_playlist/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Prompts.create_prompt_playlist(@invalid_attrs)
    end

    test "update_prompt_playlist/2 with valid data updates the prompt_playlist" do
      prompt_playlist = prompt_playlist_fixture()
      assert {:ok, %PromptPlaylist{} = prompt_playlist} = Prompts.update_prompt_playlist(prompt_playlist, @update_attrs)
    end

    test "update_prompt_playlist/2 with invalid data returns error changeset" do
      prompt_playlist = prompt_playlist_fixture()
      assert {:error, %Ecto.Changeset{}} = Prompts.update_prompt_playlist(prompt_playlist, @invalid_attrs)
      assert prompt_playlist == Prompts.get_prompt_playlist!(prompt_playlist.id)
    end

    test "delete_prompt_playlist/1 deletes the prompt_playlist" do
      prompt_playlist = prompt_playlist_fixture()
      assert {:ok, %PromptPlaylist{}} = Prompts.delete_prompt_playlist(prompt_playlist)
      assert_raise Ecto.NoResultsError, fn -> Prompts.get_prompt_playlist!(prompt_playlist.id) end
    end

    test "change_prompt_playlist/1 returns a prompt_playlist changeset" do
      prompt_playlist = prompt_playlist_fixture()
      assert %Ecto.Changeset{} = Prompts.change_prompt_playlist(prompt_playlist)
    end
  end
end
