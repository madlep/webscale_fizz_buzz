defmodule FizzBuzz.Flow do
  alias FizzBuzz.Services

  def run do
    Stream.iterate(1, fn(x) -> x + 1 end)
    |> Flow.from_enumerable
    |> Flow.map(&Services.FizzBuzz.call/1)
    |> Flow.map(&Services.Awesomify.call/1)
    |> Flow.map(&Services.Stringify.call/1)
    |> Flow.map(&Services.Louden.call/1)
    |> Flow.each(&IO.puts/1)
    |> Flow.run
  end
end
