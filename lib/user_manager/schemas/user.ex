defmodule UserManager.Schemas.User do
  import Ecto.Changeset

  use Ecto.Schema

  embedded_schema do
    field(:name, :string)
    field(:email, :string)
    field(:password, :string)
  end

  @spec changeset() :: Ecto.Changeset.t()
  def changeset(attrs \\ %{}, %__MODULE__{} = profile \\ %__MODULE__{}) do
    profile
    |> cast(attrs, [:id, :email, :password, :name])
    |> validate_required([:name, :email, :password])
    |> validate_format(:email, ~r/@/)
    |> hash_password()
  end

  defp hash_password(changeset) do
    case changeset do
      %Ecto.Changeset{valid?: true, changes: %{password: password}} ->
        put_change(changeset, :password, Bcrypt.hash_pwd_salt(password))

      _ ->
        changeset
    end
  end
end
