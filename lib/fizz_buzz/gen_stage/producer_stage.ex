defmodule FizzBuzz.GenStage.ProducerStage do
  use GenStage

  def init(nil) do
    {:producer, 1}
  end

  def handle_demand(demand, counter) when demand > 0 do
    events = Enum.to_list(counter..counter+demand-1)
    {:noreply, events, counter + demand}
  end
end
