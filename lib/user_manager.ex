defmodule UserManager do
  @moduledoc """
  Documentation for `UserManager`.
  """
  alias UserManager.Schemas.User
  alias UserManager.Repo.UserRepository
  alias EventBucket

  def create_user(user_payload_schema) do
    case User.changeset(user_payload_schema) do
      %{
        valid?: true,
        changes: user_changeset
      } ->
        case UserRepository.insert(user_changeset) do
          {:ok, user} ->
            EventBucket.publish_event("user_created", user)
            {:ok, user}

          error ->
            error
        end

      invalid_schema ->
        {:error, invalid_schema.errors}
    end
  end

  def get_user(email) do
    UserRepository.get(email)
  end
end
