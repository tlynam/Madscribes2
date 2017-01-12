defmodule Madscribes2.Sentence do
  use Madscribes2.Web, :model

  schema "sentences" do
    belongs_to :user, Madscribes2.User
    belongs_to :story, Madscribes2.Story
    field :body, :string
    field :round, :integer
    field :votes, {:array, :integer}
    field :winner, :boolean, default: false

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:user_id, :story_id, :body, :round, :votes, :winner])
    |> validate_required([:user_id, :story_id, :body, :round, :votes, :winner])
  end
end
