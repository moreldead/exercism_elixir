defmodule CollatzConjecture do
  @doc """
  calc/1 takes an integer and returns the number of steps required to get the
  number to 1 when following the rules:
    - if number is odd, multiply with 3 and add 1
    - if number is even, divide by 2
  """
  @spec calc(input :: pos_integer()) :: non_neg_integer()
  def calc(input) when is_integer(input) and input > 0 do
    count_steps(input, 0)
  end

  defp count_steps(1, step_total) do
    step_total
  end

  defp count_steps(number, step_total) do
    if rem(number, 2) == 0 do
      count_steps(div(number, 2), step_total + 1)
    else
      count_steps(number * 3 + 1, step_total + 1)
    end
  end
end