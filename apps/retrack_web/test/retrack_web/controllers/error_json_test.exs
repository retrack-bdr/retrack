defmodule RetrackWeb.ErrorJSONTest do
  use RetrackWeb.ConnCase, async: true

  test "renders 404" do
    assert RetrackWeb.ErrorJSON.render("404.json", %{}) == %{errors: %{detail: "Not Found"}}
  end

  test "renders 500" do
    assert RetrackWeb.ErrorJSON.render("500.json", %{}) ==
             %{errors: %{detail: "Internal Server Error"}}
  end
end
