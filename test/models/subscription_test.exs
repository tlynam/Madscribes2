defmodule Madscribes2.SubscriptionTest do
  use Madscribes2.ModelCase

  alias Madscribes2.Subscription

  @valid_attrs %{story_id: 42, unsubscribe_token: "some content", user_id: 42}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Subscription.changeset(%Subscription{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Subscription.changeset(%Subscription{}, @invalid_attrs)
    refute changeset.valid?
  end
end
