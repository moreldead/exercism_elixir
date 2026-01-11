defmodule PhoneNumber do
  @doc """
  Remove formatting from a phone number if the given number is valid. Return an error otherwise.
  """
  @spec clean(String.t()) :: {:ok, String.t()} | {:error, String.t()}
  def clean(raw) do
    digits = String.replace(raw, ~r/[+()\-.\s]/, "")

    cond do
      String.match?(digits, ~r/[a-zA-Z]/) ->
        {:error, "must contain digits only"}

      String.match?(digits, ~r/[^\d]/) ->
        {:error, "must contain digits only"}

      true ->
        validate_length(digits)
    end
  end

  defp validate_length(digits) do
    len = String.length(digits)

    cond do
      len < 10 ->
        {:error, "must not be fewer than 10 digits"}

      len == 11 ->
        if String.starts_with?(digits, "1") do
          validate_nanp(String.slice(digits, 1..10))
        else
          {:error, "11 digits must start with 1"}
        end

      len > 11 ->
        {:error, "must not be greater than 11 digits"}

      true ->
        validate_nanp(digits)
    end
  end

  defp validate_nanp(number) do
    area_code = String.at(number, 0)
    exchange_code = String.at(number, 3)

    cond do
      area_code == "0" -> {:error, "area code cannot start with zero"}
      area_code == "1" -> {:error, "area code cannot start with one"}
      exchange_code == "0" -> {:error, "exchange code cannot start with zero"}
      exchange_code == "1" -> {:error, "exchange code cannot start with one"}
      true -> {:ok, number}
    end
  end
end