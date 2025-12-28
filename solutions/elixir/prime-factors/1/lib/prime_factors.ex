defmodule PrimeFactors do
  @doc """
  Compute the prime factors for 'number'.

  The prime factors are prime numbers that when multiplied give the desired
  number.

  The prime factors of 'number' will be ordered lowest to highest.
  """
  @spec factors_for(pos_integer) :: [pos_integer]
  def factors_for(number) do
    find_factors(number, 2, [])
  end

  defp find_factors(1, _divisor, acc) do
    Enum.reverse(acc)
  end

  defp find_factors(number, divisor, acc) do
    if rem(number, divisor) == 0 do
      find_factors(div(number, divisor), divisor, [divisor | acc])
    else
      find_factors(number, divisor + 1, acc)
    end
  end
end