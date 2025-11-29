defmodule ResistorColorTrio do
  @doc """
  Calculate the resistance value in ohms from resistor colors
  """
  def label(colors) do
    [color1, color2, color3 | _rest] = colors

    base_value = code(color1) * 10 + code(color2)

    exponent = code(color3)

    resistance_ohms = base_value * :math.pow(10, exponent) |> trunc()

    format_label(resistance_ohms)
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


  defp format_label(resistance) when resistance >= 1_000_000_000 do
    gigaohms = div(resistance, 1_000_000_000)
    {gigaohms, :gigaohms}
  end
  defp format_label(resistance) when resistance >= 1_000_000 do
    megaohms = div(resistance, 1_000_000)
    {megaohms, :megaohms}
  end
  defp format_label(resistance) when resistance >= 1_000 do
    kiloohms = div(resistance, 1_000)
    {kiloohms, :kiloohms}
  end
  defp format_label(resistance) do
    {resistance, :ohms}
  end
end