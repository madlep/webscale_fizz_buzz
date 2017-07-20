defmodule FizzBuzz.GenServer do

  def run do
    {:ok, output}    = GenServer.start_link(FizzBuzz.GenServer.OutputServer, nil)
    {:ok, louden}    = GenServer.start_link(FizzBuzz.GenServer.LoudenServer, output)
    {:ok, stringify} = GenServer.start_link(FizzBuzz.GenServer.StringifyServer, louden)
    {:ok, awesomify} = GenServer.start_link(FizzBuzz.GenServer.AwesomifyServer, stringify)
    {:ok, fizz_buzz} = GenServer.start_link(FizzBuzz.GenServer.FizzBuzzServer, awesomify)

    spawn_link(fn -> generate(1, fizz_buzz) end)
  end

  defp generate(n, next_server) do
    GenServer.cast(next_server, {:data, n})
    generate(n + 1, next_server)
  end
end
