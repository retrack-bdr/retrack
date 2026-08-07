defmodule Retrack.Blog.Blog do
  @moduledoc """
  Schema config for the blog
  """
  use Ecto.Schema
  import Ecto.Changeset
  @compile {:no_warn_undefined, Slug}

  schema "blog" do
    field(:title, :string)
    field(:body, :string)
    field(:author_name, :string)
    field(:title_slug, :string)
    field(:tags, :string)
    field(:status, Ecto.Enum, values: [:draft, :published, :archive])

    timestamps()
  end

  @doc false
  def changeset(blog, attrs) do
    blog
    |> cast(attrs, [:title, :body, :author_name, :title_slug, :tags, :status])
    |> validate_required([:title, :body, :author_name, :status, :tags])
    |> slugify_title
  end

  defp slugify_title(changeset) do
    case get_change(changeset, :title) do
      nil ->
        changeset

      title ->
        put_change(changeset, :title_slug, Slug.slugify(title))
    end
  end
end
