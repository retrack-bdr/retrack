defmodule Retrack.Blog do
  use Ecto.Schema
  import Ecto.Changeset

  alias Retrack.Repo

  schema "blog" do
    field(:title, :string)
    field(:body, :string)
    field(:author_name, :string)
    field(:title_slug, :string)

    timestamps()
  end

  @doc false
  def changeset(blog, attrs) do
    blog
    |> cast(attrs, [:title, :body, :author_name, :title_slug])
    |> validate_required([:title, :body, :author_name])
  end

  def get_blog_posts do
    Repo.all(__MODULE__)
  end
end
