defmodule Resoluciones.Resolutions.Resolution do
  use Ecto.Schema
  import Ecto.Changeset

  schema "resolutions" do
    field :description, :string
    field :file, :string
    field :number, :integer
    field :subject, :string
    field :year, :integer

    timestamps()
  end

  @doc false
  def changeset(resolution, attrs) do
    resolution
    |> cast(attrs, [:number, :year, :subject, :description, :file])
    |> validate_required([:number, :year, :subject, :description, :file])
  end
end
