defmodule FizzBuzz.Services.Stringify do
  import FizzBuzz.Webscale

  def call(x), do: stringify(x)

  def stringify(x), do: "#{x}" |> webscale!
end
