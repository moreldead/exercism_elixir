defmodule Garden do
  @doc """
    Accepts a string representing the arrangement of cups on a windowsill and a
    list with names of students in the class. The student names list does not
    have to be in alphabetical order.

    It decodes that string into the various gardens for each student and returns
    that information in a map.
  """

  @spec info(String.t(), list) :: map
  def info(info_string, student_names \\ [
    :alice, :bob, :charlie, :david, :eve, :fred, 
    :ginny, :harriet, :ileana, :joseph, :kincaid, :larry
  ]) do
    sorted_students = Enum.sort(student_names)
    [row1, row2] = String.split(info_string, "\n")

    initial_map = Enum.into(sorted_students, %{}, fn name -> {name, {}} end)

    row1_chars = String.codepoints(row1)
    row2_chars = String.codepoints(row2)

    parse_garden(row1_chars, row2_chars, sorted_students, initial_map)
  end

  defp parse_garden([], [], _, map), do: map
  defp parse_garden(_, _, [], map), do: map

  defp parse_garden([r1a, r1b | r1_rest], [r2a, r2b | r2_rest], [student | s_rest], map) do
    plants = {
      decode_plant(r1a),
      decode_plant(r1b),
      decode_plant(r2a),
      decode_plant(r2b)
    }
    
    new_map = Map.put(map, student, plants)
    parse_garden(r1_rest, r2_rest, s_rest, new_map)
  end

  defp decode_plant("G"), do: :grass
  defp decode_plant("C"), do: :clover
  defp decode_plant("R"), do: :radishes
  defp decode_plant("V"), do: :violets
end