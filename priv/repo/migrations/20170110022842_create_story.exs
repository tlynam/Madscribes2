defmodule Madscribes2.Repo.Migrations.CreateStory do
  use Ecto.Migration

  def change do
    create table(:stories) do
      add :title, :string, null: false
      add :user_id, :integer, null: false
      add :body, :text
      add :writing_period, :integer, null: false, default: 45
      add :voting_period, :integer, null: false, default: 45
      add :started_at, :datetime
      add :rounds, :integer, null: false, default: 10

      timestamps()
    end

    create index(:stories, [:user_id])

  end
end
