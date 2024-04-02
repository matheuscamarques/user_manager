defmodule UserManager.MixProject do
  use Mix.Project

  def project do
    [
      app: :user_manager,
      version: "0.1.0",
      elixir: "~> 1.15",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {UserManager.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      # {:dep_from_hexpm, "~> 0.3.0"},
      # {:dep_from_git, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"}
      # Using on create users index
      {:uuid, "~> 1.1.8"},
      # Used for communicate nodes
      {:phoenix_pubsub, "~> 2.0"},
      # Clustering Application on production ambient
      {:libcluster, "~> 3.3.3"},
      # Using for validations schemas
      {:ecto, "~> 3.11.2"},
      # Bcrypt for the passwords
      {:bcrypt_elixir, "~> 3.1.0"},
      # Faker fot the test
      {:faker, "~> 0.18", only: [:dev, :test]}
    ]
  end
end
