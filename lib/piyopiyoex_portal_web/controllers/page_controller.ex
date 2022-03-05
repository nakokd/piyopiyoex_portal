defmodule PiyopiyoexPortalWeb.PageController do
  use PiyopiyoexPortalWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
