defmodule EliudsEggs do
  @doc """
  Given the number, count the number of eggs.
  """
  @spec egg_count(number :: integer()) :: non_neg_integer()
  def egg_count(0), do: 0

  def egg_count(number) do
    # rem(number, 2) gives us the last bit (1 if egg, 0 if empty)
    # div(number, 2) shifts the number to the right to check the next spot
    rem(number, 2) + egg_count(div(number, 2))
  end
end