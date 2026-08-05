defmodule RetrackWeb.BlogLive.Index do
  @moduledoc false
  use RetrackWeb, :live_view

  alias Retrack.Blog

  embed_templates("blog/*")

  @impl true
  def mount(_params, _session, socket) do
    blogs = Blog.get_blog_posts()

    {:ok, socket |> assign(blogs: blogs)}
  end
end
