# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Madscribes2.Repo.insert!(%Madscribes2.SomeModel{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
# Madscribes2.Repo.insert! %Madscribes2.User{
#   email: "user@example.com", password: "1234"
# }

changeset = Madscribes2.User.changeset(%Madscribes2.User{}, %{"email" => "user@example.com", "password" => "12345"})
Madscribes2.Registration.create(changeset, Madscribes2.Repo)

Madscribes2.Repo.insert! %Madscribes2.Story{
  user_id: 1, title: "Test Story", body: "Test Story"
}

Madscribes2.Repo.insert! %Madscribes2.Subscription{
  user_id: 1, story_id: 1
}

Madscribes2.Repo.insert! %Madscribes2.Sentence{
  user_id: 1, story_id: 1, body: "Test Sentence",
  round: 1, votes: [1], winner: true
}
