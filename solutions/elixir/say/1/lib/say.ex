defmodule Say do
  @doc """
  Translate a positive integer into English.
  """
  @spec in_english(integer) :: {atom, String.t()}
  def in_english(number) do
    cond do
      number < 0 or number > 999_999_999_999 ->
        {:error, "number is out of range"}

      number == 0 ->
        {:ok, "zero"}

      true ->
        {:ok, process(number)}
    end
  end
  
  defp process(0), do: ""

  defp process(n) when n >= 1_000_000_000,
    do: build_phrase(div(n, 1_000_000_000), "billion", rem(n, 1_000_000_000))

  defp process(n) when n >= 1_000_000,
    do: build_phrase(div(n, 1_000_000), "million", rem(n, 1_000_000))

  defp process(n) when n >= 1_000,
    do: build_phrase(div(n, 1_000), "thousand", rem(n, 1_000))

  defp process(n), do: say_small(n)

  defp build_phrase(count, unit, remaining) do
    main = "#{say_small(count)} #{unit}"
    if remaining > 0, do: "#{main} #{process(remaining)}", else: main
  end

  defp say_small(n) when n >= 100 do
    hundreds = "#{say_small(div(n, 100))} hundred"
    rest = rem(n, 100)
    if rest > 0, do: "#{hundreds} #{say_small(rest)}", else: hundreds
  end

  defp say_small(n) when n >= 20 do
    tens = Enum.at(["", "", "twenty", "thirty", "forty", "fifty", "sixty", "seventy", "eighty", "ninety"], div(n, 10))
    ones = rem(n, 10)
    if ones > 0, do: "#{tens}-#{say_small(ones)}", else: tens
  end

  defp say_small(n) do
    Enum.at(["", "one", "two", "three", "four", "five", "six", "seven", "eight", "nine", "ten", 
             "eleven", "twelve", "thirteen", "fourteen", "fifteen", "sixteen", "seventeen", "eighteen", "nineteen"], n)
  end
end