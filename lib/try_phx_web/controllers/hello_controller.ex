defmodule TryPhxWeb.HelloController do
  use TryPhxWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end

  def show(conn, %{"name" => name} = params) do
    render(conn, "show.html", name: name)
  end
end
