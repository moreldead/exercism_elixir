defmodule Atbash do
  @doc """
  Encode a given plaintext to the corresponding ciphertext
  """
  defp convert_char(char) do
    alphabet = String.codepoints("abcdefghijklmnopqrstuvwxyz")
    reversed = String.codepoints("zyxwvutsrqponmlkjihgfedcba")
    
    index = Enum.find_index(alphabet, fn x -> x == char end)

    if index do
      Enum.at(reversed, index)
    else
      char
    end
  end
  
  @spec encode(String.t()) :: String.t()
  def encode(plaintext) do
    plaintext
    |> String.downcase()
    |> String.replace(~r/[^a-z0-9]/, "")
    |> String.codepoints()
    |> Enum.map(&convert_char/1)
    |> Enum.chunk_every(5)
    |> Enum.map(&Enum.join/1)
    |> Enum.join(" ")
  end

  @spec decode(String.t()) :: String.t()
  def decode(cipher) do
    cipher
    |> String.replace(" ", "")
    |> String.codepoints()
    |> Enum.map(&convert_char/1)
    |> Enum.join("")
  end


end