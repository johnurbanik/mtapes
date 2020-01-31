defmodule MtapesWeb.SpotifyController do
  use MtapesWeb, :controller

  def authorize(conn, _params) do
    redirect conn, external: Spotify.Authorization.url
  end

  def authenticate(conn, params) do
    { conn, path } = case Spotify.Authentication.authenticate(conn, params) do
      { :ok, conn } ->
        conn = put_status(conn, 301)
        { conn, Routes.playlist_path(conn, :index) }
      { :error, _reason, conn } -> { conn, "/error/" }
    end

    redirect conn, to: path
  end
end