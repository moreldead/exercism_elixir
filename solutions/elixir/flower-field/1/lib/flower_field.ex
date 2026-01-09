defmodule FlowerField do
  @doc """
  Annotate empty spots next to flowers with the number of flowers next to them.
  """
  @spec annotate([String.t()]) :: [String.t()]

  def annotate(board) do
    board
    |> Enum.with_index()
    |> Enum.map(fn {row_string, row_index} ->
      row_string
      |> String.codepoints()
      |> Enum.with_index()
      |> Enum.map(fn {char, col_index} ->
        if char == "*" do
          "*"
        else
          count = count_neighbors(board, row_index, col_index)
          if count == 0 do
            " "
          else
            Integer.to_string(count)
          end
        end
      end)
      |> Enum.join("")
    end)
  end

  defp count_neighbors(board, row, col) do
    offsets = [
      {-1, -1}, {-1, 0}, {-1, 1},
      {0, -1},           {0, 1},
      {1, -1},  {1, 0},  {1, 1}
    ]

    Enum.count(offsets, fn {dr, dc} ->
      is_flower?(board, row + dr, col + dc)
    end)
  end

  defp is_flower?(board, row, col) do
    if row < 0 or col < 0 do
      false
    else
      case Enum.at(board, row) do
        nil -> false
        line -> String.at(line, col) == "*"
      end
    end
  end
end