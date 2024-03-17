defmodule UserManager.Repo.EventRepository do
  def insert(event, event_data) do
    true = :ets.insert(:event_lookup, {event, event_data})
    {:ok, event_data}
  end

  def get(event, event_data) do
    case :ets.lookup(:event_lookup, event) do
      [] -> {:error, :not_founded}
      list_of_event -> Enum.any?(list_of_event, fn {_, element} -> element == event_data end)
    end
    |> case do
      true -> {:ok, event_data}
      false -> {:error, :not_founded}
      error -> error
    end
  end
end
