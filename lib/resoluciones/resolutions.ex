defmodule Resoluciones.Resolutions do
  @moduledoc """
  The Resolutions context.
  """

  import Ecto.Query, warn: false
  alias Resoluciones.Repo

  alias Resoluciones.Resolutions.Resolution

  @doc """
  Returns the list of resolutions.

  ## Examples

      iex> list_resolutions()
      [%Resolution{}, ...]

  """
  def list_resolutions do
    Repo.all(Resolution)
  end

  @doc """
  Gets a single resolution.

  Raises `Ecto.NoResultsError` if the Resolution does not exist.

  ## Examples

      iex> get_resolution!(123)
      %Resolution{}

      iex> get_resolution!(456)
      ** (Ecto.NoResultsError)

  """
  def get_resolution!(id), do: Repo.get!(Resolution, id)

  @doc """
  Creates a resolution.

  ## Examples

      iex> create_resolution(%{field: value})
      {:ok, %Resolution{}}

      iex> create_resolution(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_resolution(attrs \\ %{}) do
    %Resolution{}
    |> Resolution.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a resolution.

  ## Examples

      iex> update_resolution(resolution, %{field: new_value})
      {:ok, %Resolution{}}

      iex> update_resolution(resolution, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_resolution(%Resolution{} = resolution, attrs) do
    resolution
    |> Resolution.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a resolution.

  ## Examples

      iex> delete_resolution(resolution)
      {:ok, %Resolution{}}

      iex> delete_resolution(resolution)
      {:error, %Ecto.Changeset{}}

  """
  def delete_resolution(%Resolution{} = resolution) do
    Repo.delete(resolution)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking resolution changes.

  ## Examples

      iex> change_resolution(resolution)
      %Ecto.Changeset{data: %Resolution{}}

  """
  def change_resolution(%Resolution{} = resolution, attrs \\ %{}) do
    Resolution.changeset(resolution, attrs)
  end
end
