defmodule AuthieWeb.PageController do
  use AuthieWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end

  # this will never be called it's just here to support no localized main
  def dummy(conn, _params) do
    render(conn, "index.html")
  end
end
