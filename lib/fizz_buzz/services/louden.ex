defmodule FizzBuzz.Services.Louden do
  import FizzBuzz.Webscale

  def call(x), do: louden(x)

  def louden(x), do: x |> String.upcase |> webscale!
end
