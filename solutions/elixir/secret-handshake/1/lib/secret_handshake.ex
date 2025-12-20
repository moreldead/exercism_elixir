defmodule SecretHandshake do
  use Bitwise

  @doc """
  Determine the actions of a secret handshake based on the binary
  representation of the given `code`.
  """
  @spec commands(code :: integer) :: list(String.t())
  def commands(code) do
    []
    |> check_bit(code, 1, "wink")
    |> check_bit(code, 2, "double blink")
    |> check_bit(code, 4, "close your eyes")
    |> check_bit(code, 8, "jump")
    |> check_reverse(code)
  end

  defp check_bit(actions, code, bit, label) do
    if (code &&& bit) != 0 do
      actions ++ [label]
    else
      actions
    end
  end

  defp check_reverse(actions, code) do
    if (code &&& 16) != 0 do
      Enum.reverse(actions)
    else
      actions
    end
  end
end