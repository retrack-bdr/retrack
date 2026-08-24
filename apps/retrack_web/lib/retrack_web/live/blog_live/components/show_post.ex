defmodule RetrackWeb.BlogLive.Components.ShowPost do
  @moduledoc false
  use Phoenix.Component

  attr(:title, :string, default: "")
  attr(:body, :string, default: "")
  attr(:author_name, :string, default: "")
  attr(:tags, :string, default: "")
  attr(:id, :string, required: true)

  def post(assigns) do
    ~H"""
    <div class="mx-auto w-full max-w-4xl px-6 py-12">
      <article class="space-y-8">
        <!-- Header -->
        <header class="space-y-4 border-b border-base-300 pb-8">
          <h1 class="text-4xl font-bold tracking-tight">
            {@title}
          </h1>

          <div class="flex flex-wrap items-center gap-3 text-sm opacity-70">
            <span>{@author_name}</span>

            <span>&bull;</span>
          </div>

          <div class="flex flex-wrap gap-2">
            <% tags = @tags || "" %>
            <%= for tag <- String.split(tags, ",") || "" do %>
              <span class="rounded-md border border-base-300 px-3 py-1 text-sm hover:border-primary">
                {String.trim(tag)}
              </span>
            <% end %>
          </div>
        </header>

        <!-- Body -->
        <section class="prose prose-lg text-lg dark:prose-invert max-w-none">
          <div class="whitespace-pre-wrap">{@body}</div>

          <%!-- Eventually replace the line above with: --%>
          <%!-- {markdown(@post.body)} --%>
        </section>
      </article>
    </div>
    """
  end
end
