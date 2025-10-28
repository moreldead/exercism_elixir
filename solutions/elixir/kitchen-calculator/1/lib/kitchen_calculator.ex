defmodule KitchenCalculator do
  def get_volume(volume_pair) do
    # Please implement the get_volume/1 function
    {_, volume} = volume_pair
    volume
  end

  def to_milliliter({:cup,amount}) do
    # Please implement the to_milliliter/1 functions
    {:milliliter, amount * 240}
  end

  def to_milliliter({:fluid_ounce,amount}) do
    # Please implement the to_milliliter/1 functions
    {:milliliter, amount * 30}
  end
  
  def to_milliliter({:teaspoon,amount}) do
    # Please implement the to_milliliter/1 functions
    {:milliliter, amount * 5}
  end
  
  def to_milliliter({:tablespoon,amount}) do
    # Please implement the to_milliliter/1 functions
    {:milliliter, amount * 15}
  end
  
  def to_milliliter({:milliliter,amount}) do
    # Please implement the to_milliliter/1 functions
    {:milliliter, amount}
  end

  def from_milliliter({:milliliter,amount}, :cup) do
    # Please implement the from_milliliter/2 functions
    {:cup, amount / 240}
  end

  def from_milliliter({:milliliter,amount}, :fluid_ounce) do
    # Please implement the from_milliliter/2 functions
    {:fluid_ounce, amount / 30}
  end

  def from_milliliter({:milliliter,amount}, :teaspoon) do
    # Please implement the from_milliliter/2 functions
    {:teaspoon, amount / 5}
  end

  def from_milliliter({:milliliter,amount}, :tablespoon) do
    # Please implement the from_milliliter/2 functions
    {:tablespoon, amount / 15}
  end

  def from_milliliter({:milliliter,amount}, :milliliter) do
    # Please implement the from_milliliter/2 functions
    {:milliliter, amount}
  end
  
  def convert(volume_pair, unit) do
    # Please implement the convert/2 function
    from_milliliter(to_milliliter(volume_pair),unit)
  end

  
  

  
end
