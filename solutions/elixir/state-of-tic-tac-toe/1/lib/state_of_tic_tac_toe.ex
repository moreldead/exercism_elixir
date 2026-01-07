defmodule StateOfTicTacToe do
  @doc """
  Determine the state a game of tic-tac-toe where X starts.
  """
  @spec game_state(board :: String.t()) :: {:ok, :win | :ongoing | :draw} | {:error, String.t()}
  def game_state(board) do
    rows = board |> String.split("\n", trim: true) |> Enum.map(&String.codepoints/1)
    flat_board = List.flatten(rows)
    
    x_count = Enum.count(flat_board, &(&1 == "X"))
    o_count = Enum.count(flat_board, &(&1 == "O"))
    
    empty_count = Enum.count(flat_board, fn c -> c == "." or c == " " end)

    cond do
      o_count > x_count -> 
        {:error, "Wrong turn order: O started"}
      x_count > o_count + 1 -> 
        {:error, "Wrong turn order: X went twice"}
      true ->
        x_wins = winner?(rows, "X")
        o_wins = winner?(rows, "O")

        cond do
          x_wins and o_wins -> 
            {:error, "Impossible board: game should have ended after the game was won"}
          x_wins and x_count == o_count -> 
            {:error, "Impossible board: game should have ended after the game was won"}
          o_wins and x_count > o_count -> 
            {:error, "Impossible board: game should have ended after the game was won"}
          x_wins or o_wins -> 
            {:ok, :win}
          empty_count == 0 -> 
            {:ok, :draw}
          true -> 
            {:ok, :ongoing}
        end
    end
  end

  defp winner?(rows, player) do
    cols = for i <- 0..2, do: for(row <- rows, do: Enum.at(row, i))
    diag1 = [Enum.at(Enum.at(rows, 0), 0), Enum.at(Enum.at(rows, 1), 1), Enum.at(Enum.at(rows, 2), 2)]
    diag2 = [Enum.at(Enum.at(rows, 0), 2), Enum.at(Enum.at(rows, 1), 1), Enum.at(Enum.at(rows, 2), 0)]
    
    (rows ++ cols ++ [diag1, diag2])
    |> Enum.any?(fn line -> Enum.all?(line, &(&1 == player)) end)
  end
end