defmodule FizzBuzz do

  def streamed, do: FizzBuzz.Streamed.run

  def gen_server, do: FizzBuzz.GenServer.run

  def gen_stage, do: FizzBuzz.GenStage.run

  def flow, do: FizzBuzz.Flow.run
end
