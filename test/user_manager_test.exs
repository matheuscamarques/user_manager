defmodule UserManagerTest do
  use ExUnit.Case, async: false
  doctest UserManager

  test "create unique user with all procedutes" do
    user_payload_schema = %{
      name: "Fulano de tal",
      email: "fulano@email.com",
      password: "password"
    }

    {:ok, created_user} = UserManager.create_user(user_payload_schema)
    {:ok, user} = UserManager.get_user(created_user.email)

    assert user.name == "Fulano de tal"
    assert user.email == "fulano@email.com"
    assert user.password != nil
    assert user.id != nil

    {:ok, user_event} = EventBucket.get_event("user_created", user)

    assert user_event == user
  end

  test "create two users with identity emails returning error" do
    user_payload_schema = %{
      name: "Fulano de tal",
      email: "fulano2@email.com",
      password: "password"
    }

    UserManager.create_user(user_payload_schema)
    assert {:error, :user_already_registred} == UserManager.create_user(user_payload_schema)
  end
end
