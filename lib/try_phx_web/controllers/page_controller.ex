defmodule TryPhxWeb.PageController do
  use TryPhxWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
