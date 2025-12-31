defmodule PascalsTriangle do
  @doc """
  Calculates the rows of a pascal triangle
  with the given height
  """
  @spec rows(integer) :: [[integer]]
  def rows(num) do
    generate_rows(num, [])
  end

  defp generate_rows(0, acc), do: Enum.reverse(acc)

  defp generate_rows(num, []) do
    generate_rows(num - 1, [[1]])
  end

  defp generate_rows(num, [last_row | _] = acc) do
    new_row = calculate_row(last_row)
    generate_rows(num - 1, [new_row | acc])
  end

  defp calculate_row(row) do
    left_shifted = [0] ++ row
    right_shifted = row ++ [0]

    Enum.zip_with(left_shifted, right_shifted, fn a, b -> a + b end)
  end
end