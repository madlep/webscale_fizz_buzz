defmodule FizzBuzz.Streamed do
  alias FizzBuzz.Services

  def run do
    Stream.iterate(1, fn(x) -> x + 1 end)
    |> Stream.map(&Services.FizzBuzz.call/1)
    |> Stream.map(&Services.Awesomify.call/1)
    |> Stream.map(&Services.Stringify.call/1)
    |> Stream.map(&Services.Louden.call/1)
    |> Stream.each(&IO.puts/1)
    |> Stream.run
  end
end
