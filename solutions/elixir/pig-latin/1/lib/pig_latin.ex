defmodule PigLatin do
  @doc """
  Given a `phrase`, translate it a word at a time to Pig Latin.
  """
  defp translate_word(word) do
    cond do
      String.match?(word, ~r/^([aeiou]|xr|yt)/) ->
        word <> "ay"

      match = Regex.run(~r/^([^aeiou]*qu)(.*)/, word) ->
        [_, head, tail] = match
        tail <> head <> "ay"

      match = Regex.run(~r/^([^aeiouy]+)(y.*)/, word) ->
        [_, head, tail] = match
        tail <> head <> "ay"


      match = Regex.run(~r/^([^aeiou]+)(.*)/, word) ->
        [_, head, tail] = match
        tail <> head <> "ay"

      true ->
        word
    end
  end
  
  @spec translate(phrase :: String.t()) :: String.t()
  def translate(phrase) do
    phrase
    |> String.split()
    |> Enum.map(fn word -> translate_word(word) end)
    |> Enum.join(" ")
  end


end