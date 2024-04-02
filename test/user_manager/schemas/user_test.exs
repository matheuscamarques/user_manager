defmodule UserManager.Schemas.UserTest do
  use ExUnit.Case
  doctest UserManager.Schemas.User
  alias UserManager.Factory
  alias UserManager.Schemas.User

  describe "User Schema Test" do
    test "create changeset/1 invalid data only map" do
      assert %{valid?: false} = User.changeset(%{})
    end

    test "create changeset/1 invalid data only email" do
      assert %{valid?: false} = User.changeset(%{email: Faker.Internet.email()})
    end

    test "create changeset/1 invalid data only name" do
      assert %{valid?: false} = User.changeset(%{name: Faker.Internet.user_name()})
    end

    test "create changeset/1 invalid data only password" do
      assert %{valid?: false} = User.changeset(%{password: Faker.Cannabis.buzzword()})
    end

    test "create changeset/1 valid data" do
      assert %{valid?: true} = User.changeset(Factory.data(:user))
    end
  end
end
