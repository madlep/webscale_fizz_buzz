defmodule FizzBuzz.GenStage.OutputStage do
  use GenStage

  def init(nil) do
    {:consumer, nil}
  end

  def handle_events(events, _from, state) do
    Enum.each(events, &IO.puts/1)
    {:noreply, [], state}
  end
end
