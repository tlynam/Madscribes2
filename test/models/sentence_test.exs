defmodule Madscribes2.SentenceTest do
  use Madscribes2.ModelCase

  alias Madscribes2.Sentence

  @valid_attrs %{body: "some content", round: 42, story_id: 42, user_id: 42, votes: 42, winner: true}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Sentence.changeset(%Sentence{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Sentence.changeset(%Sentence{}, @invalid_attrs)
    refute changeset.valid?
  end
end
