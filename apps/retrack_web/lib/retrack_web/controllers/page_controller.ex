defmodule RetrackWeb.PageController do
  use RetrackWeb, :controller

  def home(conn, _params) do
    render(conn, :home)
  end
end
