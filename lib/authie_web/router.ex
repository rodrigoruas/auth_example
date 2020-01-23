defmodule AuthieWeb.Router do
  use AuthieWeb, :router
  require Ueberauth

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug SetLocale,
      gettext: Authie.I18n,
      default_locale: "en"
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", AuthieWeb do
    pipe_through :browser

    get "/", PageController, :dummy
  end


  # scope "/auth", AuthieWeb do
  #   pipe_through([:browser])

  #   get("/logout", AuthController, :delete)
  #   get("/:provider", AuthController, :request)
  #   get("/:provider/callback", AuthController, :callback)
  #   post("/:provider/callback", AuthController, :callback)
  # end


  scope "/:locale", AuthieWeb do
    pipe_through([:browser])

    get "/", PageController, :index

    scope "/auth" do
      get("/logout", AuthController, :delete)
      get("/:provider", AuthController, :request)
      get("/:provider/callback", AuthController, :callback)
      post("/:provider/callback", AuthController, :callback)
    end
  end


  # Other scopes may use custom stacks.
  # scope "/api", AuthieWeb do
  #   pipe_through :api
  # end
end
