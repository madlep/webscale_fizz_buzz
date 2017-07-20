defmodule FizzBuzz.Services.FizzBuzz do
  import FizzBuzz.Webscale

  def call(x), do: fizz_buzz(x)

  def fizz_buzz(x) when rem(x,3) == 0 and rem(x,5) == 0, do: "fizzbuzz" |> webscale!
  def fizz_buzz(x) when rem(x,3) == 0, do: "fizz" |> webscale!
  def fizz_buzz(x) when rem(x,5) == 0, do: "buzz" |> webscale!
  def fizz_buzz(x), do: x |> webscale!
end
