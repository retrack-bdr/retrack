defmodule Retrack.Repo.Migrations.CreateBlog do
  use Ecto.Migration

  def change do
    create table(:blog) do
      add(:title, :string)
      add(:body, :text)
      add(:author_name, :string, default: "Patrick Wendo")
      add(:title_slug, :string)
      add(:tags, :string, default: "")
      add(:status, :string, default: "draft")

      timestamps()
    end
  end
end
