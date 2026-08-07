defmodule Retrack.BlogTest do
  use Retrack.DataCase, async: true

  alias Retrack.Blog.Blogs

  alias Retrack.BlogFixtures

  @valid_attrs %{
    title: "My first blog",
    body: "This is the body.",
    author_name: "Patrick",
    tags: "elixir, phoenix",
    status: :draft
  }

  @update_attrs %{
    title: "Updated title",
    body: "Updated body",
    author_name: "Jane",
    title_slug: "updated-title",
    tags: "elixir, phoenix"
  }

  @invalid_attrs %{
    title: nil,
    body: nil,
    author_name: nil,
    tags: nil
  }

  describe "list/0" do
    test "returns all blog posts" do
      blog = BlogFixtures.blog_fixture()

      assert Blogs.list_posts() == [blog]
    end
  end

  describe "get!/1" do
    test "returns the requested blog" do
      blog = BlogFixtures.blog_fixture()

      assert Blogs.get!(blog.id).id == blog.id
    end

    test "raises if blog does not exist" do
      assert_raise Ecto.NoResultsError, fn ->
        Blogs.get!(-1)
      end
    end
  end

  describe "get/1" do
    test "returns the blog" do
      blog = BlogFixtures.blog_fixture()

      assert Blogs.get(blog.id).id == blog.id
    end

    test "returns nil if blog does not exist" do
      assert Blogs.get(-1) == nil
    end
  end

  describe "create/1" do
    test "creates a blog with valid data" do
      assert {:ok, blog} = Blogs.create(@valid_attrs)

      assert blog.title == "My first blog"
      assert blog.body == "This is the body."
      assert blog.author_name == "Patrick"
      assert blog.title_slug == "my-first-blog"
    end

    test "returns errors with invalid data" do
      assert {:error, changeset} = Blogs.create(@invalid_attrs)

      refute changeset.valid?
    end
  end

  describe "update/2" do
    test "updates a blog" do
      blog = BlogFixtures.blog_fixture()

      assert {:ok, updated_blog} =
               Blogs.update(blog, @update_attrs)

      assert updated_blog.title == "Updated title"
      assert updated_blog.body == "Updated body"
      assert updated_blog.author_name == "Jane"
      assert updated_blog.title_slug == "updated-title"
    end

    test "returns errors with invalid data" do
      blog = BlogFixtures.blog_fixture()

      assert {:error, changeset} =
               Blogs.update(blog, @invalid_attrs)

      refute changeset.valid?

      assert blog.id == Blogs.get!(blog.id).id
    end
  end

  describe "delete/1" do
    test "deletes a blog" do
      blog = BlogFixtures.blog_fixture()

      assert {:ok, _} = Blogs.delete(blog)

      assert_raise Ecto.NoResultsError, fn ->
        Blogs.get!(blog.id)
      end
    end
  end

  describe "change/2" do
    test "returns a changeset" do
      blog = BlogFixtures.blog_fixture()

      changeset = Blogs.change(blog)

      assert %Ecto.Changeset{} = changeset
    end
  end
end
