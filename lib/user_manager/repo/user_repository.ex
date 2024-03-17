defmodule UserManager.Repo.UserRepository do
  def insert(user) do
    uuid = UUID.uuid4()
    # user validations
    # hashing_password
    # Insert on database
    created_user = Map.put(user, :id, uuid)

    case :ets.insert_new(:user_lookup, {user.email, created_user}) do
      true -> {:ok, created_user}
      false -> {:error, :user_already_registred}
    end
  end

  def get(email) do
    case :ets.lookup(:user_lookup, email) do
      [] -> {:error, :not_founded}
      [{_id, user}] -> {:ok, user}
    end
  end
end
