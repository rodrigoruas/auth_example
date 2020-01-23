# use Mix.Config
import Config

# Configure your database
config :authie, Authie.Repo,
  username: "postgres",
  password: "postgres",
  database: "authie_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :authie, AuthieWeb.Endpoint,
  http: [port: 4002],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn


config :ueberauth, Ueberauth,
  providers: [
    facebook: { Ueberauth.Strategy.Facebook, [
      default_scope: "email, public_profile, user_friends",
      profile_fields: "name, email, first_name, last_name",
      request_path: "/en/auth/facebook",
      callback_path: "/en/auth/facebook/callback"
      ]
    },
    identity: { Ueberauth.Strategy.Identity, [
      callback_methods: ["POST"],
      request_path: "/en/auth/identity",
      callback_path: "/en/auth/identity/callback"
    ]}
  ],
  json_library: Jason,
  base_path: "/:locale/auth"

config :ueberauth, Ueberauth.Strategy.Facebook.OAuth,
  client_id: System.get_env("FACEBOOK_CLIENT_ID"),
  client_secret: System.get_env("FACEBOOK_CLIENT_SECRET")
