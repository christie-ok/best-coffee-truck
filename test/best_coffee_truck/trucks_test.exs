defmodule BestCoffeeTruck.TrucksTest do
  use BestCoffeeTruck.DataCase

  alias BestCoffeeTruck.Trucks

  @long_string "3hUnTUw9bT6pqWVWEEOpBejlBMkUK606zjm8UCFx40qJV1QK8TjwzamYTIXheEOHHJYYMSOyHnY2dl9y303Q4w3kcFVHdx7Laj67lkxG5vHpkUnLRseyhwnEoZMiL2nBWErqXzzUPZ1KITE72H0yTrC5hyAuViCGWp35utZ7OecFsxCkNlcOWgSKgfS6pXcfytnLC9y9YQTyhVy7q4uvOWjdGLDCM2z8QfGwDSRAptxPpkEQRb5rwgfStpcthvSk"

  describe "trucks" do
    alias BestCoffeeTruck.Trucks.Truck

    @invalid_attrs %{menu: nil, name: nil}

    test "list_trucks/0 returns all trucks" do
      truck = insert(:truck)
      assert Trucks.list_trucks() == [truck]
    end

    test "get_truck!/1 returns the truck with given id" do
      truck = insert(:truck)
      assert Trucks.get_truck!(truck.id) == truck
    end

    test "create_truck/1 with valid data creates a truck" do
      valid_attrs = %{menu: "some menu", name: "some name"}

      assert {:ok, %Truck{} = truck} = Trucks.create_truck(valid_attrs)
      assert truck.menu == "some menu"
      assert truck.name == "some name"
    end

    test "menu longer than 255 characters will be trimmed and inserted" do
      attrs = %{menu: @long_string, name: "some name"}

      assert {:ok, %Truck{} = truck} = Trucks.create_truck(attrs)

      assert truck.menu ==
               "3hUnTUw9bT6pqWVWEEOpBejlBMkUK606zjm8UCFx40qJV1QK8TjwzamYTIXheEOHHJYYMSOyHnY2dl9y303Q4w3kcFVHdx7Laj67lkxG5vHpkUnLRseyhwnEoZMiL2nBWErqXzzUPZ1KITE72H0yTrC5hyAuViCGWp35utZ7OecFsxCkNlcOWgSKgfS6pXcfytnLC9y9YQTyhVy7q4uvOWjdGLDCM2z8QfGwDSRAptxPpkEQRb5rwgfStpcthvS"
    end

    test "create_truck/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Trucks.create_truck(@invalid_attrs)
    end
  end
end
