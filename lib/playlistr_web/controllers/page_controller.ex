defmodule PlaylistrWeb.PageController do
  use PlaylistrWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
