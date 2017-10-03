require IEx

defmodule Madscribes2.PageController do
  alias Madscribes2.Session
  use Madscribes2.Web, :controller

  def index(conn, _params) do
    IEx.pry
    # # :cowboy_req.port(conn)

    # elem(conn.adapter, 1).streamid

    # TODO: get stream ID from `push`, then actually send the file
    :cowboy_req.push("/js/app.js", to_headers_map([{"content-type", "application/javascript"}]), elem(conn.adapter, 1))
    # Plug.Conn.H2.push(conn, "/css/app.css", [{"accept", "text/css"}])

    # {:ok, pid} = StringIO.open("body{ color: red }")

    # :cowboy_req.stream_body(pid, :nofin, elem(conn.adapter, 1))

    render conn, "index.html", current_user: Session.current_user(conn)
  end

  def to_headers_map(headers) do
    # Group set-cookie headers into a list for a single `set-cookie` key since cowboy 2 requires headers as a map.
    Enum.reduce(headers, %{}, fn
      ({key = "set-cookie", value}, acc) ->
        set_cookies = Map.get(acc, key, [])
        Map.put(acc, key, [value | set_cookies])
      ({key, value}, acc) ->
        Map.put(acc, key, value)
    end)
  end
end
