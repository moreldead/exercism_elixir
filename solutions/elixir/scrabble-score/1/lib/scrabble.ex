defmodule Scrabble do
  @doc """
  Calculate the scrabble score for the word.
  """
  @spec score(String.t()) :: non_neg_integer
  def score(word) do
    word
    |> String.trim()
    |> String.upcase()
    |> String.codepoints()
    |> Enum.map(fn letter -> letter_value(letter) end)
    |> Enum.sum()
  end

  defp letter_value(letter) do
    cond do
      letter in ["A", "E", "I", "O", "U", "L", "N", "R", "S", "T"] -> 1
      letter in ["D", "G"] -> 2
      letter in ["B", "C", "M", "P"] -> 3
      letter in ["F", "H", "V", "W", "Y"] -> 4
      letter in ["K"] -> 5
      letter in ["J", "X"] -> 8
      letter in ["Q", "Z"] -> 10
      true -> 0 # If it's not a letter, it's worth nothing
    end
  end
end