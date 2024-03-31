defmodule UserManager.Repo.EventRepositoryTest do
  use ExUnit.Case
  doctest UserManager.Repo.EventRepository
  alias UserManager.Factory
  alias UserManager.Repo.EventRepository

  describe "function insert" do
    test "Inserting user event" do
      user = Factory.data(:user)

      assert EventRepository.insert("user_created", user) ==
               {:ok, %{name: user.name, password: user.password, email: user.email}}
    end
  end

  describe "function get" do
    test "Get Many Events" do
      num_users = 10_000_000

      task_users =
        Enum.map(1..num_users, fn _ ->
          Task.async(fn -> Factory.build(:user) end)
        end)

      {:ok, user} = Enum.random(task_users) |> Task.await()

      assert EventRepository.get("user_created", user) ==
               {:ok, user}
    end
  end
end
