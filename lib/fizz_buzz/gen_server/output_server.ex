defmodule FizzBuzz.GenServer.OutputServer do
  use GenServer

  def handle_cast({:data, x}, state) do
    IO.puts x
    {:noreply, state}
  end
end
