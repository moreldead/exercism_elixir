defmodule HighSchoolSweetheart do
  def first_letter(name) do
    # Please implement the first_letter/1 function
    String.at(String.trim(name), 0)
  end

  def initial(name) do
    # Please implement the initial/1 function
    first_letter(name)
    |>String.upcase()
    |>Kernel.<>(".")
  end

  def initials(full_name) do
    # Please implement the initials/1 function
    name_list = String.split(full_name)
    [name_letter, surname_letter] = name_list
    initial(name_letter) <> " " <> initial(surname_letter)
  end

  def pair(full_name1, full_name2) do
    # ❤-------------------❤
    # |  X. X.  +  X. X.  |
    # ❤-------------------❤
    
    # Please implement the pair/2 function

    "❤-------------------❤\n|  "<>initials(full_name1)<>"  +  "<>initials(full_name2)<>"  |\n❤-------------------❤\n"
    
  end
end
