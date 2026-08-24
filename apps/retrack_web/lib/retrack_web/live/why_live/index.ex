defmodule RetrackWeb.WhyLive.Index do
  @moduledoc false
  use RetrackWeb, :live_view

  import RetrackWeb.CoreComponents

  embed_templates("why_live/*")

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end
end
