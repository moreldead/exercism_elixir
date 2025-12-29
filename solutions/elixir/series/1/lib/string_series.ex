defmodule StringSeries do
  @doc """
  Given a string `s` and a positive integer `size`, return all substrings
  of that size. If `size` is greater than the length of `s`, or less than 1,
  return an empty list.
  """
  @spec slices(s :: String.t(), size :: integer) :: list(String.t())
  def slices(s, size) do
    string_length = String.length(s)

    cond do
      size > string_length or size < 1 ->
        []

      true ->
        s
        |> String.codepoints()
        |> Enum.chunk_every(size, 1, :discard)
        |> Enum.map(fn list_of_chars -> Enum.join(list_of_chars) end)
    end
  end
end