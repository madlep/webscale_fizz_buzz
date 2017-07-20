defmodule FizzBuzz.Services.Awesomify do
  import FizzBuzz.Webscale

  def call(x), do: awesomify(x)

  def awesomify(x) when is_number(x), do: x
  def awesomify(x), do: "***#{x}***" |> webscale!
end
