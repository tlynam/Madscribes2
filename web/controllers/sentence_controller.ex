defmodule Madscribes2.SentenceController do
  use Madscribes2.Web, :controller

  alias Madscribes2.Story
  alias Madscribes2.Sentence

  def create(conn, %{"sentence" => sentence_params}) do
    changeset = Sentence.changeset(%Sentence{}, sentence_params)
    # changeset.user_id = current_user(conn).id

    case Repo.insert(changeset) do
      {:ok, _sentence} ->
        conn
        |> put_flash(:info, "Sentence created successfully.")
        |> redirect(to: story_path(conn, :show, changeset.changes.story_id))
      {:error, changeset} ->
        Enum.map(changeset.errors, fn {k, v} ->
          "#{k} #{Enum.map(v, fn {error, given_value} -> error end) |> Enum.join(" and ")}"
        end) |> Enum.join(", ")

        conn
        |> put_flash(:info, "Sentence had errors: #{}")
        |> redirect(to: story_path(conn, :show, changeset.changes.story_id))
    end
  end
end
