defmodule MatchingBrackets do
  @doc """
  Checks that all the brackets and braces in the string are matched correctly, and nested correctly
  """
  @spec check_brackets(String.t()) :: boolean
  def check_brackets(str) do
    str
    |> String.codepoints()
    |> check_list([])
  end

  defp check_list([], stack) do
    stack == []
  end

  defp check_list([char | rest], stack) do
    cond do
      char == "[" or char == "{" or char == "(" ->
        check_list(rest, [char | stack])

      char == "]" ->
        case stack do
          ["[" | tail] -> check_list(rest, tail)
          _ -> false
        end

      char == "}" ->
        case stack do
          ["{" | tail] -> check_list(rest, tail)
          _ -> false
        end

      char == ")" ->
        case stack do
          ["(" | tail] -> check_list(rest, tail)
          _ -> false
        end

      true ->
        check_list(rest, stack)
    end
  end
end