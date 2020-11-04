defmodule ResolucionesWeb.ResolutionControllerTest do
  use ResolucionesWeb.ConnCase

  alias Resoluciones.Resolutions

  @create_attrs %{description: "some description", file: "some file", number: 42, subject: "some subject", year: 42}
  @update_attrs %{description: "some updated description", file: "some updated file", number: 43, subject: "some updated subject", year: 43}
  @invalid_attrs %{description: nil, file: nil, number: nil, subject: nil, year: nil}

  def fixture(:resolution) do
    {:ok, resolution} = Resolutions.create_resolution(@create_attrs)
    resolution
  end

  describe "index" do
    test "lists all resolutions", %{conn: conn} do
      conn = get(conn, Routes.resolution_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Resolutions"
    end
  end

  describe "new resolution" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.resolution_path(conn, :new))
      assert html_response(conn, 200) =~ "New Resolution"
    end
  end

  describe "create resolution" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.resolution_path(conn, :create), resolution: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.resolution_path(conn, :show, id)

      conn = get(conn, Routes.resolution_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Resolution"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.resolution_path(conn, :create), resolution: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Resolution"
    end
  end

  describe "edit resolution" do
    setup [:create_resolution]

    test "renders form for editing chosen resolution", %{conn: conn, resolution: resolution} do
      conn = get(conn, Routes.resolution_path(conn, :edit, resolution))
      assert html_response(conn, 200) =~ "Edit Resolution"
    end
  end

  describe "update resolution" do
    setup [:create_resolution]

    test "redirects when data is valid", %{conn: conn, resolution: resolution} do
      conn = put(conn, Routes.resolution_path(conn, :update, resolution), resolution: @update_attrs)
      assert redirected_to(conn) == Routes.resolution_path(conn, :show, resolution)

      conn = get(conn, Routes.resolution_path(conn, :show, resolution))
      assert html_response(conn, 200) =~ "some updated description"
    end

    test "renders errors when data is invalid", %{conn: conn, resolution: resolution} do
      conn = put(conn, Routes.resolution_path(conn, :update, resolution), resolution: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Resolution"
    end
  end

  describe "delete resolution" do
    setup [:create_resolution]

    test "deletes chosen resolution", %{conn: conn, resolution: resolution} do
      conn = delete(conn, Routes.resolution_path(conn, :delete, resolution))
      assert redirected_to(conn) == Routes.resolution_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.resolution_path(conn, :show, resolution))
      end
    end
  end

  defp create_resolution(_) do
    resolution = fixture(:resolution)
    %{resolution: resolution}
  end
end
