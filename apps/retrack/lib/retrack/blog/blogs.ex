defmodule Retrack.Blog.Blogs do
  @moduledoc """
  Provides general a CRUD API for blogs.
  """
  alias Retrack.Blog.Blog
  alias Retrack.Repo

  import Ecto.{Query}

  @doc """
  Returns all blog posts.
  """
  def list_posts do
    from(b in Blog, order_by: [desc: b.inserted_at])
    |> Repo.all()
  end

  @doc """
  Returns a single blog post by id.

  Raises `Ecto.NoResultsError` if it doesn't exist.
  """
  def get!(id) do
    Repo.get!(Blog, id)
  end

  @doc """
  Returns a single blog post by id.

  Returns `nil` if it doesn't exist.
  """
  def get(id) do
    Repo.get(Blog, id)
  end

  @doc """
  Creates a new blog post.
  """
  def create(attrs) do
    %Blog{}
    |> Blog.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates an existing blog post.
  """
  def update(%Blog{} = blog, attrs) do
    blog
    |> Blog.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a blog post.
  """
  def delete(%Blog{} = blog) do
    Repo.delete(blog)
  end

  @doc """
  Returns a Blog.changeset for editing.
  """
  def change(%Blog{} = blog, attrs \\ %{}) do
    Blog.changeset(blog, attrs)
  end
end
