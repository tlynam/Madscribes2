# http://nithinbekal.com/posts/phoenix-authentication/

defmodule Madscribes2.User do
  use Madscribes2.Web, :model

  schema "users" do
    field :email, :string
    field :encrypted_password, :string
    field :password, :string, virtual: true
    has_many :stories, Madscribes2.Story
    has_many :subscriptions, Madscribes2.Subscription

    timestamps
  end

  @required_fields ~w(email password)

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, @required_fields)
    |> validate_required([:email, :password])
    |> unique_constraint(:email)
    |> validate_format(:email, ~r/@/)
    |> validate_length(:password, min: 5)
  end
end
