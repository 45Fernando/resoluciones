defmodule Resoluciones.ResolutionsTest do
  use Resoluciones.DataCase

  alias Resoluciones.Resolutions

  describe "resolutions" do
    alias Resoluciones.Resolutions.Resolution

    @valid_attrs %{description: "some description", file: "some file", number: 42, subject: "some subject", year: 42}
    @update_attrs %{description: "some updated description", file: "some updated file", number: 43, subject: "some updated subject", year: 43}
    @invalid_attrs %{description: nil, file: nil, number: nil, subject: nil, year: nil}

    def resolution_fixture(attrs \\ %{}) do
      {:ok, resolution} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Resolutions.create_resolution()

      resolution
    end

    test "list_resolutions/0 returns all resolutions" do
      resolution = resolution_fixture()
      assert Resolutions.list_resolutions() == [resolution]
    end

    test "get_resolution!/1 returns the resolution with given id" do
      resolution = resolution_fixture()
      assert Resolutions.get_resolution!(resolution.id) == resolution
    end

    test "create_resolution/1 with valid data creates a resolution" do
      assert {:ok, %Resolution{} = resolution} = Resolutions.create_resolution(@valid_attrs)
      assert resolution.description == "some description"
      assert resolution.file == "some file"
      assert resolution.number == 42
      assert resolution.subject == "some subject"
      assert resolution.year == 42
    end

    test "create_resolution/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Resolutions.create_resolution(@invalid_attrs)
    end

    test "update_resolution/2 with valid data updates the resolution" do
      resolution = resolution_fixture()
      assert {:ok, %Resolution{} = resolution} = Resolutions.update_resolution(resolution, @update_attrs)
      assert resolution.description == "some updated description"
      assert resolution.file == "some updated file"
      assert resolution.number == 43
      assert resolution.subject == "some updated subject"
      assert resolution.year == 43
    end

    test "update_resolution/2 with invalid data returns error changeset" do
      resolution = resolution_fixture()
      assert {:error, %Ecto.Changeset{}} = Resolutions.update_resolution(resolution, @invalid_attrs)
      assert resolution == Resolutions.get_resolution!(resolution.id)
    end

    test "delete_resolution/1 deletes the resolution" do
      resolution = resolution_fixture()
      assert {:ok, %Resolution{}} = Resolutions.delete_resolution(resolution)
      assert_raise Ecto.NoResultsError, fn -> Resolutions.get_resolution!(resolution.id) end
    end

    test "change_resolution/1 returns a resolution changeset" do
      resolution = resolution_fixture()
      assert %Ecto.Changeset{} = Resolutions.change_resolution(resolution)
    end
  end
end
