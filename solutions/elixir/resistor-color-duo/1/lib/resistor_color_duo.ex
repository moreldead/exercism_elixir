defmodule ResistorColorDuo do
  @doc """
  Calculate a resistance value from two colors
  """
  def value(colors) do
    [color1, color2 | _rest] = colors

    digit1 = code(color1)
    digit2 = code(color2)

    digit1 * 10 + digit2
  end

  defp code(:black), do: 0
  defp code(:brown), do: 1
  defp code(:red), do: 2
  defp code(:orange), do: 3
  defp code(:yellow), do: 4
  defp code(:green), do: 5
  defp code(:blue), do: 6
  defp code(:violet), do: 7
  defp code(:grey), do: 8
  defp code(:white), do: 9
end