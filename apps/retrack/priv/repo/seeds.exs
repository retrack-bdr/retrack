# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Retrack.Repo.insert!(%Retrack.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
# ===========
# Blog Seeds
# ===========
alias Retrack.Repo
alias Retrack.Blog.Blog

posts = [
  %{
    title: "Introducing Retrack",
    tags: "elixir,Phoenix",
    status: "draft",
    title_slug: "introducing-retrack",
    author_name: "Patrick Wendo",
    body: """
    Welcome to Retrack! This is the first post introducing the project,
    its goals, and the vision behind building a modern blogging platform
    with Elixir and Phoenix.
    """
  },
  %{
    title: "Why Phoenix is a Great Choice",
    tags: "elixir,Phoenix",
    status: "draft",
    title_slug: "why-phoenix-is-a-great-choice",
    author_name: "Patrick Wendo",
    body: """
    Phoenix offers excellent developer productivity, real-time capabilities,
    and a scalable architecture powered by the Erlang VM.
    """
  },
  %{
    title: "Understanding Ecto",
    tags: "elixir,Phoenix",
    status: "draft",
    title_slug: "understanding-ecto",
    author_name: "Patrick Wendo",
    body: """
    Ecto provides a clean and composable way to interact with databases,
    build queries, and validate data through changesets.
    """
  },
  %{
    title: "Building REST APIs",
    tags: "elixir,Phoenix",
    status: "draft",
    title_slug: "building-rest-apis",
    author_name: "Patrick Wendo",
    body: """
    Phoenix makes building JSON APIs straightforward with controllers,
    views, and pattern matching.
    """
  },
  %{
    title: "Database Migrations Explained",
    tags: "elixir,Phoenix",
    status: "draft",
    title_slug: "database-migrations-explained",
    author_name: "Patrick Wendo",
    body: """
    Migrations allow your application's database schema to evolve
    alongside your codebase in a repeatable manner.
    """
  },
  %{
    title: "Deploying Phoenix Applications",
    tags: "elixir,Phoenix",
    status: "draft",
    title_slug: "deploying-phoenix-applications",
    author_name: "Patrick Wendo",
    body: """
    Learn how to package and deploy Phoenix applications using releases,
    Docker, and modern cloud platforms.
    """
  },
  %{
    title: "Authentication Strategies",
    tags: "elixir,Phoenix",
    status: "draft",
    title_slug: "authentication-strategies",
    author_name: "Patrick Wendo",
    body: """
    Explore session-based authentication, token authentication,
    and best practices for securing your applications.
    """
  },
  %{
    title: "Testing with ExUnit",
    tags: "elixir,Phoenix",
    status: "draft",
    title_slug: "testing-with-exunit",
    author_name: "Patrick Wendo",
    body: """
    ExUnit provides a powerful and expressive testing framework that
    integrates seamlessly with the Elixir ecosystem.
    """
  },
  %{
    title: "Performance Tips for Phoenix",
    tags: "elixir,Phoenix",
    status: "draft",
    title_slug: "performance-tips-for-phoenix",
    author_name: "Patrick Wendo",
    body: """
    Improve application performance by optimizing queries,
    reducing N+1 problems, and leveraging caching.
    """
  },
  %{
    title: "What's Next for Retrack?",
    tags: "elixir,Phoenix",
    status: "draft",
    title_slug: "whats-next-for-retrack",
    author_name: "Patrick Wendo",
    body: """
    A look ahead at upcoming features including categories,
    comments, search, and richer content editing.
    """
  }
]

Enum.each(posts, fn attrs ->
  %Blog{}
  |> Blog.changeset(attrs)
  |> Repo.insert!()
end)
