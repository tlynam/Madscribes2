defmodule Madscribes2.Subscription do
  use Madscribes2.Web, :model

  schema "subscriptions" do
    field :unsubscribe_token, :string

    belongs_to :story, Madscribes2.Story
    belongs_to :user, Madscribes2.User

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:user_id, :story_id, :unsubscribe_token])
    |> validate_required([:user_id, :story_id, :unsubscribe_token])
  end
end
