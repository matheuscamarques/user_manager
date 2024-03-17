defmodule UserManager.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    start_ets()

    children = [
      # Starts a worker by calling: UserManager.Worker.start_link(arg)
      # {UserManager.Worker, arg}
      {Phoenix.PubSub,
      name: UserManager.PubSub},
      {EventBucket, []}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: UserManager.Supervisor]
    Supervisor.start_link(children, opts)
  end

  def start_ets() do
    :user_lookup = :ets.new(:user_lookup, [:set, :public, :named_table])
    :event_lookup = :ets.new(:event_lookup, [:duplicate_bag, :public, :named_table])
  end
end
