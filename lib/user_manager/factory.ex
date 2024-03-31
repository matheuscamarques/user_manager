defmodule UserManager.Factory do

  @doc """

  """
  def build(:user, atributes \\ %{}) do
    data(:user, atributes)
    |> UserManager.create_user()
  end

  def data(:user, atributes \\ %{}) do
    %{
      name: Faker.Person.PtBr.name(),
      email: Faker.Internet.free_email(),
      password: Faker.Internet.safe_email()
    }
    |> Map.merge(atributes)
  end
end
