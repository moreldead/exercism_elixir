defmodule GuessingGame do
  def compare(secret_number, guess \\ :empty_guess)
  
  def compare(_secret_number, guess) when guess === :empty_guess or not is_integer(guess) do
    "Make a guess"
  end
  
  def compare(secret_number, guess) when secret_number === guess do
    # Please implement the compare/2 function
    "Correct"
  end
  
  def compare(secret_number, guess) when abs(secret_number - guess) == 1 do
    # Please implement the compare/2 function
    "So close"
  end
  
  def compare(secret_number, guess) when secret_number < guess do
    # Please implement the compare/2 function
    "Too high"
  end

  def compare(secret_number, guess) when secret_number > guess do
    # Please implement the compare/2 function
    "Too low"
  end

end
