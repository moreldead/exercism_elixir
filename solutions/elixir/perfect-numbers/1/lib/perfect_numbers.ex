defmodule PerfectNumbers do
  @doc """
  Determine the aliquot sum of the given `number`, by summing all the factors
  of `number`, aside from `number` itself.

  Based on this sum, classify the number as:

  :perfect if the aliquot sum is equal to `number`
  :abundant if the aliquot sum is greater than `number`
  :deficient if the aliquot sum is less than `number`
  """
  @spec classify(number :: integer) :: {:ok, atom} | {:error, String.t()}
  def classify(number) do
    if number < 1 do
      {:error, "Classification is only possible for natural numbers."}
    else
      aliquot_sum = 
        if number == 1 do
          0
        else
          1..(number - 1)
          |> Enum.filter(fn x -> rem(number, x) == 0 end)
          |> Enum.sum()
        end

      cond do
        aliquot_sum == number -> {:ok, :perfect}
        aliquot_sum > number -> {:ok, :abundant}
        aliquot_sum < number -> {:ok, :deficient}
      end
    end
  end
end