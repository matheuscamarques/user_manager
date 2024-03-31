defmodule UserManagerTest do
  alias UserManager.Factory
  use ExUnit.Case, async: false
  doctest UserManager

  test "create unique user with all procedutes" do
    user_payload_schema = Factory.data(:user)

    {:ok, created_user} = UserManager.create_user(user_payload_schema)
    {:ok, user} = UserManager.get_user(created_user.email)

    assert user.name == user_payload_schema.name
    assert user.email == user_payload_schema.email
    assert user.password != user_payload_schema.password
    assert user.password != nil
    assert user.id != nil

    {:ok, user_event} = EventBucket.get_event("user_created", user)

    assert user_event == user
  end

  test "create two users with identity emails returning error" do
    user_payload_schema = Factory.data(:user)

    UserManager.create_user(user_payload_schema)
    assert {:error, :user_already_registred} == UserManager.create_user(user_payload_schema)
  end
end
