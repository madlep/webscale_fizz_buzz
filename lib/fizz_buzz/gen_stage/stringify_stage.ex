defmodule FizzBuzz.GenStage.StringifyStage do
  use GenStage

  def init(nil) do
    {:producer_consumer, nil}
  end

  def handle_events(events, _from, state) do
    tasks = Enum.map(events, fn(event) ->
      Task.async(fn -> FizzBuzz.Services.Stringify.call(event) end)
    end)

    results = Enum.map(tasks, fn(task) ->
      Task.await(task)
    end)

    {:noreply, results, state}
  end
end
