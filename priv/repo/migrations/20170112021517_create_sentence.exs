defmodule Madscribes2.Repo.Migrations.CreateSentence do
  use Ecto.Migration

  def change do
    create table(:sentences) do
      add :user_id, :integer, null: false
      add :story_id, :integer, null: false
      add :body, :text, null: false
      add :round, :integer, null: false
      add :votes, {:array, :integer}, null: false
      add :winner, :boolean, default: false, null: false

      timestamps()
    end

  end
end
