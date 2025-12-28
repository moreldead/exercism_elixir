defmodule BottleSong do
  @moduledoc """
  Handles lyrics of the popular children song: Ten Green Bottles
  """

  @spec recite(pos_integer, pos_integer) :: String.t()
  def recite(start_bottle, take_down) do
    start_bottle..(start_bottle - take_down + 1)
    |> Enum.map(fn n -> verse(n) end)
    |> Enum.join("\n\n")
  end

  defp verse(number) do
    current = number_to_word(number)
    next = number_to_word(number - 1) |> String.downcase()
    
    s1 = if number == 1, do: "", else: "s"
    s2 = if number - 1 == 1, do: "", else: "s"

    """
    #{current} green bottle#{s1} hanging on the wall,
    #{current} green bottle#{s1} hanging on the wall,
    And if one green bottle should accidentally fall,
    There'll be #{next} green bottle#{s2} hanging on the wall.
    """ |> String.trim()
  end

  defp number_to_word(n) do
    case n do
      10 -> "Ten"
      9 -> "Nine"
      8 -> "Eight"
      7 -> "Seven"
      6 -> "Six"
      5 -> "Five"
      4 -> "Four"
      3 -> "Three"
      2 -> "Two"
      1 -> "One"
      0 -> "No"
    end
  end
end