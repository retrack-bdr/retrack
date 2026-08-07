defmodule RetrackWeb.BlogLive.Create do
  use RetrackWeb, :live_view

  alias Retrack.Blog.Blog
  alias Retrack.Blog.Blogs

  embed_templates("blog/*")

  @impl true
  def mount(_params, _session, socket) do
    draft = %Blog{
      title: "",
      body: "",
      author_name: "",
      tags: "",
      status: :draft
    }

    changeset = Blogs.change(draft)

    {:ok,
     assign(socket,
       form: to_form(changeset),
       preview: false
     )}
  end

  @impl true
  def handle_event("validate", %{"blog" => attrs}, socket) do
    changeset =
      %Blog{}
      |> Blogs.change(attrs)
      |> Map.put(:action, :validate)

    {:noreply,
     assign(socket,
       form: to_form(changeset)
     )}
  end

  @impl true
  def handle_event("create_blog", _, socket) do
    attrs = %{
      title: socket.assigns.form[:title].value,
      body: socket.assigns.form[:body].value,
      tags: socket.assigns.form[:tags].value,
      author_name: socket.assigns.form[:author_name].value,
      status: :published
    }

    case Blogs.create(attrs) do
      {:ok, _post} ->
        {:noreply,
         socket
         |> put_flash(:info, "Blog post created.")
         |> push_navigate(to: "/blog")}

      {:error, changeset} ->
        {:noreply,
         assign(socket,
           form: to_form(changeset)
         )}
    end
  end

  @impl true
  def handle_event("toggle_preview", _, socket) do
    {:noreply, update(socket, :preview, &(!&1))}
  end
end
