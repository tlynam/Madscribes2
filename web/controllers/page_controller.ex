defmodule Madscribes2.PageController do
  use Madscribes2.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
