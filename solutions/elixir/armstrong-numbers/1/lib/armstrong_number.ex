defmodule ArmstrongNumber do
  @moduledoc """
  Provides a way to validate whether or not a number is an Armstrong number
  """

  @spec valid?(integer) :: boolean
  def valid?(number) do
    digits = Integer.digits(number)
    
    exponent = length(digits)

    sum = Enum.reduce(digits, 0, fn digit, acc ->
      acc + Integer.pow(digit, exponent)
    end)

    sum == number
  end
end