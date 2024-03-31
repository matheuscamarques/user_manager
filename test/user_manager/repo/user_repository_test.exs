defmodule UserManager.Repo.UserRepositoryTest do
  use ExUnit.Case
  doctest UserManager.Repo.UserRepository
  alias UserManager.Factory
  alias UserManager.Repo.UserRepository

  describe "function insert" do
    test "Insert User" do
      user = Factory.data(:user)

      assert {:ok, user_created} = UserRepository.insert(user)

      assert user_created.name == user.name
      assert user_created.email == user.email
      assert user_created.password == user.password
      assert not is_nil(Map.get(user_created, :id))
    end
  end

  describe "function get" do
    test "Get Created User" do
      user = Factory.data(:user)

      assert {:ok, created_user} = UserRepository.insert(user)

      assert UserRepository.get(user.email) == {:ok, created_user}
    end
  end
end
