defmodule School do
  @moduledoc """
  Simulate students in a school.

  Each student is in a grade.
  """

  @type school :: %{integer => [String.t()]}

  @doc """
  Create a new, empty school.
  """
  @spec new() :: school
  def new() do
    %{}
  end

  @doc """
  Add a student to a particular grade in school.
  """
  @spec add(school, String.t(), integer) :: {:ok | :error, school}
  def add(school, name, grade) do
    all_names = List.flatten(Map.values(school))

    if Enum.member?(all_names, name) do
      {:error, school}
    else
      current_grade_list = Map.get(school, grade, [])
      new_school = Map.put(school, grade, [name | current_grade_list])
      {:ok, new_school}
    end
  end

  @doc """
  Return the names of the students in a particular grade, sorted alphabetically.
  """
  @spec grade(school, integer) :: [String.t()]
  def grade(school, grade) do
    school
    |> Map.get(grade, [])
    |> Enum.sort()
  end

  @doc """
  Return the names of all the students in the school sorted by grade and name.
  """
  @spec roster(school) :: [String.t()]
  def roster(school) do
    school
    |> Map.keys()
    |> Enum.sort()
    |> Enum.flat_map(fn grade_num -> grade(school, grade_num) end)
  end
end