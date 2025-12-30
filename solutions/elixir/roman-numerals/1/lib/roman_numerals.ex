defmodule RomanNumerals do
  @doc """
  Convert the number to a roman number.
  """
  defp do_numeral(number) do
    cond do
      number >= 1000 -> "M" <> do_numeral(number - 1000)
      number >= 900 -> "CM" <> do_numeral(number - 900)
      number >= 500 -> "D" <> do_numeral(number - 500)
      number >= 400 -> "CD" <> do_numeral(number - 400)
      number >= 100 -> "C" <> do_numeral(number - 100)
      number >= 90 -> "XC" <> do_numeral(number - 90)
      number >= 50 -> "L" <> do_numeral(number - 50)
      number >= 40 -> "XL" <> do_numeral(number - 40)
      number >= 10 -> "X" <> do_numeral(number - 10)
      number >= 9 -> "IX" <> do_numeral(number - 9)
      number >= 5 -> "V" <> do_numeral(number - 5)
      number >= 4 -> "IV" <> do_numeral(number - 4)
      number >= 1 -> "I" <> do_numeral(number - 1)
      true -> ""
    end
  end
  
  @spec numeral(pos_integer) :: String.t()
  def numeral(number) do
    do_numeral(number)
  end


end