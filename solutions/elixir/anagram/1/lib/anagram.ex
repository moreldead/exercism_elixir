defmodule Anagram do
  @doc """
  Returns all candidates that are anagrams of, but not equal to, 'base'.
  """
  
  defp sort_string(string) do
    string
    |> String.codepoints()
    |> Enum.sort()
  end
  
  @spec match(String.t(), [String.t()]) :: [String.t()]
  def match(base, candidates) do
    base_lower = String.downcase(base)
    base_sorted = sort_string(base_lower)

    Enum.filter(candidates, fn candidate ->
      candidate_lower = String.downcase(candidate)
      
      candidate_lower != base_lower and sort_string(candidate_lower) == base_sorted
    end)
  end

end