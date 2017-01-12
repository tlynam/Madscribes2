defmodule Madscribes2.Repo.Migrations.CreateSubscription do
  use Ecto.Migration

  def change do
    create table(:subscriptions) do
      add :user_id, :integer, null: false
      add :story_id, :integer, null: false
      add :unsubscribe_token, :text

      timestamps()
    end

    create unique_index(:subscriptions, [:user_id, :story_id])

  end
end
