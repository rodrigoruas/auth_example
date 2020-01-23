defmodule AuthieWeb.AuthController do
  use AuthieWeb, :controller

  plug Ueberauth

  require Logger

  alias Ueberauth.Strategy.Helpers

  def request(conn, _params) do
    render(conn, "request.html", callback_url: Helpers.callback_url(conn))
  end

  def callback(%{assigns: %{ueberauth_failure: _fails}} = conn, _params) do

    Logger.error("oops shit happened on fb")

    conn
    |> put_flash(:error, "Failed to authenticate.")
    |> redirect(to: "/")
  end

  def callback(%{assigns: %{ueberauth_auth: _auth}} = conn, _params) do

    Logger.debug("FBOK")

    conn
    |> put_flash(:info, "Successfully authenticated")
    |> redirect(to: "/")
  end

  def delete(conn, _params) do
    conn
    |> put_flash(:info, "You have been logged out!")
    |> configure_session(drop: true)
    |> redirect(to: "/")
  end

end
