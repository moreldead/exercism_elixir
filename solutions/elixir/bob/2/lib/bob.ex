defmodule Bob do
  @spec hey(String.t()) :: String.t()
  def hey(input) do
    input = String.trim(input)

    cond do
      silence?(input) ->
        "Fine. Be that way!"

      shouting?(input) && question?(input) ->
        "Calm down, I know what I'm doing!"

      shouting?(input) ->
        "Whoa, chill out!"

      question?(input) ->
        "Sure."

      true ->
        "Whatever."
    end
  end

  defp silence?(input), do: input == ""

  defp question?(input), do: String.ends_with?(input, "?")

  defp shouting?(input) do
    String.upcase(input) == input && String.downcase(input) != input
  end
end