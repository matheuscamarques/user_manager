defmodule UserManager do
  @moduledoc """
  Documentation for `UserManager`.
  """
  alias UserManager.Repo.UserRepository
  alias EventBucket

  def create_user(user_payload_schema) do
    ## criar usuario no banco
    case UserRepository.insert(user_payload_schema) do
      {:ok, user} ->
        EventBucket.publish_event("user_created", user)
        {:ok, user}

      error ->
        error
    end
  end

  def get_user(email) do
    {:ok, user} = UserRepository.get(email)
    {:ok, user}
  end
end
