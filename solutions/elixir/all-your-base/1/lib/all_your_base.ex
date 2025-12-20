defmodule AllYourBase do
  @doc """
  Given a number in input base, represented as a sequence of digits, converts it to output base,
  or returns an error tuple if either of the bases are less than 2
  """
  @spec convert(list, integer, integer) :: {:ok, list} | {:error, String.t()}
  def convert(digits, input_base, output_base) do
    cond do
      input_base < 2 ->
        {:error, "input base must be >= 2"}

      output_base < 2 ->
        {:error, "output base must be >= 2"}

      Enum.any?(digits, fn d -> d < 0 or d >= input_base end) ->
        {:error, "all digits must be >= 0 and < input base"}

      true ->
        decimal_value = Enum.reduce(digits, 0, fn d, acc -> acc * input_base + d end)

        {:ok, to_digits(decimal_value, output_base)}
    end
  end

  defp to_digits(0, _base), do: [0]

  defp to_digits(num, base) do
    do_to_digits(num, base, [])
  end

  defp do_to_digits(0, _base, acc), do: acc

  defp do_to_digits(num, base, acc) do
    do_to_digits(div(num, base), base, [rem(num, base) | acc])
  end
end