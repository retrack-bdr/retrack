defmodule Retrack.BlogFixtures do
  @moduledoc """
  Fixtures for the blog
  """
  alias Retrack.Blog.Blogs

  @valid_attrs %{
    title: "My first blog",
    body: "This is the body.",
    author_name: "Patrick",
    tags: "elixir",
    status: :draft
  }

  def blog_fixture(attrs \\ %{}) do
    {:ok, blog} =
      attrs
      |> Enum.into(@valid_attrs)
      |> Blogs.create()

    blog
  end
end
