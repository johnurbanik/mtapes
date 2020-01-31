defmodule MtapesWeb.Router do
  use MtapesWeb, :router
  use Pow.Phoenix.Router
  use PowAssent.Phoenix.Router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  pipeline :protected do
    plug Pow.Plug.RequireAuthenticated,
      error_handler: Pow.Phoenix.PlugErrorHandler
  end

  pipeline :skip_csrf_protection do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :put_secure_browser_headers
  end

  pipeline :spotify do
    plug MtapesWeb.Plugs.Auth
  end

  scope "/" do
    pipe_through [:skip_csrf_protection]

    pow_assent_authorization_post_callback_routes()
  end

  scope "/" do
    pipe_through [:browser]
    pow_routes()
    pow_assent_authorization_routes()
  end

  scope "/", MtapesWeb do
    pipe_through [:browser, :protected, :spotify]

    get "/", PageController, :index
    resources "/playlist", PlaylistController
    resources "/ps", PlaylistSongController
    resources "/song", SongController
    resources "/prompts", PromptController
    resources "/pp", PromptPlaylistController
    resources "/pv", PromptVoteController
    resources "/ppv", PlaylistVoteController
  end

  scope "/spotify", MtapesWeb do
    pipe_through :browser

    get "/authorize", SpotifyController, :authorize
    get "/authenticate", SpotifyController, :authenticate
  end

  # Other scopes may use custom stacks.
  # scope "/api", MtapesWeb do
  #   pipe_through :api
  # end
end
