defmodule Prime do
  @doc """
  Generates the nth prime.
  """
  @spec nth(non_neg_integer) :: non_neg_integer
  def nth(count) when is_integer(count) and count > 0 do
    find_prime(2, 0, count)
  end

  defp find_prime(number, found_count, target) do
    if is_prime?(number) do
      current_count = found_count + 1

      if current_count == target do
        number
      else
        find_prime(number + 1, current_count, target)
      end
    else
      find_prime(number + 1, found_count, target)
    end
  end

  defp is_prime?(2), do: true
  defp is_prime?(number) do
    2..(number - 1)
    |> Enum.all?(fn divisor -> rem(number, divisor) != 0 end)
  end
end