defmodule EventBucket do
  alias UserManager.Repo.{
    UserRepository,
    EventRepository
  }

  use GenServer
  alias Phoenix.PubSub

  @pubsub UserManager.PubSub

  def start_link(init_args) do
    # you may want to register your server with `name: __MODULE__`
    # as a third argument to `start_link`
    GenServer.start_link(__MODULE__, [init_args], name: __MODULE__ )
  end

  def init(_args) do
    PubSub.subscribe(@pubsub, "user_created")
    {:ok, :initial_state}
  end

  # Public functions
  def get_event(event, event_data) do
    GenServer.call(__MODULE__, {event, event_data})
  end

  def publish_event(event, event_data) do
    PubSub.broadcast(@pubsub,event, {event, event_data})
    {:ok, event_data}
  end

  ## Server
  def handle_info({"user_created", event_data}, state) do
    EventRepository.insert("user_created",event_data)
    UserRepository.insert(event_data)
    {:noreply, state}
  end

  def handle_call({"user_created", event_data}, _from, state) do
    result = EventRepository.get("user_created", event_data)
    {:reply, result, state}
  end
end
