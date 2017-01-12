defmodule Madscribes2.Story do
  use Madscribes2.Web, :model

  schema "stories" do
    field :title, :string
    field :body, :string
    field :writing_period, :integer
    field :voting_period, :integer
    field :started_at, Ecto.DateTime
    field :rounds, :integer

    belongs_to :user, Madscribes2.User
    has_many :subscriptions, Madscribes2.Subscription
    has_many :sentences, Madscribes2.Sentence

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:title, :user_id, :body, :writing_period, :voting_period, :started_at, :rounds])
    |> validate_required([:title, :user_id, :body, :writing_period, :voting_period, :started_at, :rounds])
  end

  def subscription_count do
    # Repo.aggregate(self.subscriptions, :count, :id)
    5
  end
end
