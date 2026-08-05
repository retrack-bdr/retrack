defmodule RetrackWeb.PageControllerTest do
  use RetrackWeb.ConnCase

  test "GET /", %{conn: conn} do
    conn = get(conn, ~p"/")

    assert html_response(conn, 200) =~
             "transforms documents from static files into collaborative,"
  end
end
