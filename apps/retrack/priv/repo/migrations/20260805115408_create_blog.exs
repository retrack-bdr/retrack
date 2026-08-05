defmodule Retrack.Repo.Migrations.CreateBlog do
  use Ecto.Migration

  def change do
    create table(:blog) do
      add :title, :string
      add :body, :text
      add :author_name, :string
      add :title_slug, :string

      timestamps()
    end
  end
end
