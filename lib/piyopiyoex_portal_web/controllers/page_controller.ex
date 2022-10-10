defmodule PiyopiyoexPortalWeb.PageController do
  use PiyopiyoexPortalWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end

  def policy(conn, _params) do
    render(conn, "policy.html")
  end
end
