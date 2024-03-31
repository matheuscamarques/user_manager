defmodule UserManager.Repo.UserRepository do
  def insert(%{id: _} = user) do
    case :ets.insert_new(:user_lookup, {user.email, user}) do
      true -> {:ok, user}
      false -> {:error, :user_already_registred}
    end
  end

  def insert(user) do
    uuid = UUID.uuid4()
    created_user = Map.put(user, :id, uuid)
    insert(created_user)
  end

  def get(email) do
    case :ets.lookup(:user_lookup, email) do
      [] -> {:error, :not_founded}
      [{_id, user}] -> {:ok, user}
    end
  end
end
