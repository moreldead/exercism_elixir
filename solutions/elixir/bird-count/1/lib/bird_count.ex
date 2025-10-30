defmodule BirdCount do
  def today([]) do
    # Please implement the today/1 function
    nil
  end

  def today([head | _tail]) do
    head
  end

  def increment_day_count([]) do
    # Please implement the increment_day_count/1 function
    [1]
  end

  def increment_day_count([head | tail]) do
    # Please implement the has_day_without_birds?/1 function
    [head + 1 | tail]
  end

  def has_day_without_birds?([]) do
    # Please implement the total/1 function
    false
  end
  
  def has_day_without_birds?([0 | _tail]) do
    true
  end
  
  def has_day_without_birds?([_head | tail]) do
    has_day_without_birds?(tail)
  end

  def total([]) do
    0
  end

  def total([head | tail]) do
    head + total(tail)
  end
  
  def busy_days([]) do
    0
  end
  
  def busy_days([head | tail]) when head >= 5 do
    1 + busy_days(tail)
  end
  
  def busy_days([_head | tail]) do
    busy_days(tail)
  end
end
