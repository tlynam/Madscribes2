defmodule Madscribes2.Sentence do
  use Madscribes2.Web, :model

  schema "sentences" do
    field :user_id, :integer
    field :story_id, :integer
    field :body, :string
    field :round, :integer
    field :votes, :integer
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
