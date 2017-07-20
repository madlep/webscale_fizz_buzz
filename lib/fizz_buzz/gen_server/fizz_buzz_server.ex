defmodule FizzBuzz.GenServer.FizzBuzzServer do
  use GenServer

  alias FizzBuzz.Services

  def init(next_server) do
    {:ok, next_server}
  end

  def handle_cast({:data, x}, next_server) do
    fb = Services.FizzBuzz.call(x)
    GenServer.cast(next_server, {:data, fb})
    {:noreply, next_server}
  end
end
