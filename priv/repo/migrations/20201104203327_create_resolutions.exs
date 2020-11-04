defmodule Resoluciones.Repo.Migrations.CreateResolutions do
  use Ecto.Migration

  def change do
    create table(:resolutions) do
      add :number, :integer
      add :year, :integer
      add :subject, :string
      add :description, :string
      add :file, :string

      timestamps()
    end

  end
end
