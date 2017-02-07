defmodule Madscribes2.PageController do
  alias Madscribes2.Session
  use Madscribes2.Web, :controller

  def index(conn, _params) do
    render conn, "index.html", current_user: Session.current_user(conn)
  end
end
