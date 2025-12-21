defmodule Sublist do
  @doc """
  Returns whether the first list is a sublist or a superlist of the second list
  and if not whether it is equal or unequal to the second list.
  """
  def compare(a, b) do
    cond do
      a == b -> :equal
      contains?(b, a) -> :sublist
      contains?(a, b) -> :superlist
      true -> :unequal
    end
  end

  defp contains?(_full, []), do: true
  defp contains?([], _sub), do: false

  defp contains?(full, sub) do
    List.starts_with?(full, sub) or contains?(tl(full), sub)
  end
end