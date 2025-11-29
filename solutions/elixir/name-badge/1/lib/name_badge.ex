defmodule NameBadge do
  def print(id, name, department) do
    # Please implement the print/3 function
    final_department = if department do
      String.upcase(department)
    else
      "OWNER"
    end

    if id do
      "[#{id}] - #{name} - #{final_department}"
    else
      "#{name} - #{final_department}"
    end
  end
end
