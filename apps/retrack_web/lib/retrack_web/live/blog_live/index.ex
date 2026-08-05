defmodule RetrackWeb.BlogLive.Index do
  @moduledoc false
  use RetrackWeb, :live_view

  alias Retrack.Blog.Blogs

  embed_templates("blog/*")

  @impl true
  def mount(_params, _session, socket) do
    posts = Blogs.list_posts()

    {:ok, socket |> assign(posts: posts)}
  end
end
