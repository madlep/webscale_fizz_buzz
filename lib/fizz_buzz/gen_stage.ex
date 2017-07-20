defmodule FizzBuzz.GenStage do
  def run do
    {:ok, producer}  = GenStage.start_link(FizzBuzz.GenStage.ProducerStage, nil)
    {:ok, fizz_buzz} = GenStage.start_link(FizzBuzz.GenStage.FizzBuzzStage, nil)
    {:ok, awesomify} = GenStage.start_link(FizzBuzz.GenStage.AwesomifyStage, nil)
    {:ok, stringify} = GenStage.start_link(FizzBuzz.GenStage.StringifyStage, nil)
    {:ok, louden}    = GenStage.start_link(FizzBuzz.GenStage.LoudenStage, nil)
    {:ok, output}    = GenStage.start_link(FizzBuzz.GenStage.OutputStage, nil)

    GenStage.sync_subscribe(output, to: louden)
    GenStage.sync_subscribe(louden, to: stringify)
    GenStage.sync_subscribe(stringify, to: awesomify)
    GenStage.sync_subscribe(awesomify, to: fizz_buzz)
    GenStage.sync_subscribe(fizz_buzz, to: producer)
  end
end
