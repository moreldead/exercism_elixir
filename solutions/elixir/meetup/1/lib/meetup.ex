defmodule Meetup do
  @moduledoc """
  Calculate meetup dates.
  """

  @type weekday ::
          :monday
          | :tuesday
          | :wednesday
          | :thursday
          | :friday
          | :saturday
          | :sunday

  @type schedule :: :first | :second | :third | :fourth | :last | :teenth

  @doc """
  Calculate a meetup date.

  The schedule is in which week (1..4, last or "teenth") the meetup date should
  fall.
  """
  @spec meetup(pos_integer, pos_integer, weekday, schedule) :: Date.t()
  def meetup(year, month, weekday, schedule) do
    days_to_search = get_days_for_schedule(year, month, schedule)
    
    Enum.find_value(days_to_search, fn day ->
      date = Date.new!(year, month, day)
      if day_to_atom(Date.day_of_week(date)) == weekday do
        date
      end
    end)
  end

  defp get_days_for_schedule(_year, _month, :first), do: 1..7
  defp get_days_for_schedule(_year, _month, :second), do: 8..14
  defp get_days_for_schedule(_year, _month, :third), do: 15..21
  defp get_days_for_schedule(_year, _month, :fourth), do: 22..28
  defp get_days_for_schedule(_year, _month, :teenth), do: 13..19
  defp get_days_for_schedule(year, month, :last) do
    last_day = Date.days_in_month(Date.new!(year, month, 1))
    last_day..(last_day - 6)
  end

  defp day_to_atom(1), do: :monday
  defp day_to_atom(2), do: :tuesday
  defp day_to_atom(3), do: :wednesday
  defp day_to_atom(4), do: :thursday
  defp day_to_atom(5), do: :friday
  defp day_to_atom(6), do: :saturday
  defp day_to_atom(7), do: :sunday
end