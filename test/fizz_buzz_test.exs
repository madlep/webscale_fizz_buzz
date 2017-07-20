defmodule FizzBuzzTest do
  use ExUnit.Case
  doctest FizzBuzz

  test "it fizzes and buzzes" do
    result = FizzBuzz.stream
    |> Enum.take(15)
    assert result == [
      1,
      2,
      "***fizz***",
      4,
      "***buzz***",
      "***fizz***",
      7,
      8,
      "***fizz***",
      "***buzz***",
      11,
      "***fizz***",
      13,
      14,
      "***fizzbuzz***"
    ]
  end
end
