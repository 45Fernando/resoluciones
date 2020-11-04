defmodule ResolucionesWeb.ResolutionController do
  use ResolucionesWeb, :controller

  alias Resoluciones.Resolutions
  alias Resoluciones.Resolutions.Resolution

  def index(conn, _params) do
    resolutions = Resolutions.list_resolutions()
    render(conn, "index.html", resolutions: resolutions)
  end

  def new(conn, _params) do
    changeset = Resolutions.change_resolution(%Resolution{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"resolution" => resolution_params}) do
    case Resolutions.create_resolution(resolution_params) do
      {:ok, resolution} ->
        conn
        |> put_flash(:info, "Resolution created successfully.")
        |> redirect(to: Routes.resolution_path(conn, :show, resolution))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    resolution = Resolutions.get_resolution!(id)
    render(conn, "show.html", resolution: resolution)
  end

  def edit(conn, %{"id" => id}) do
    resolution = Resolutions.get_resolution!(id)
    changeset = Resolutions.change_resolution(resolution)
    render(conn, "edit.html", resolution: resolution, changeset: changeset)
  end

  def update(conn, %{"id" => id, "resolution" => resolution_params}) do
    resolution = Resolutions.get_resolution!(id)

    case Resolutions.update_resolution(resolution, resolution_params) do
      {:ok, resolution} ->
        conn
        |> put_flash(:info, "Resolution updated successfully.")
        |> redirect(to: Routes.resolution_path(conn, :show, resolution))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", resolution: resolution, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    resolution = Resolutions.get_resolution!(id)
    {:ok, _resolution} = Resolutions.delete_resolution(resolution)

    conn
    |> put_flash(:info, "Resolution deleted successfully.")
    |> redirect(to: Routes.resolution_path(conn, :index))
  end
end
