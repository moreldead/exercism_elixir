defmodule Username do
  def sanitize([]), do: []
  def sanitize([head | tail]) do
    case head do
      head when ?a <= head and head <= ?z -> [head] ++ sanitize(tail)
      head when head == ?_ -> [head] ++ sanitize(tail)
      head when head == ?ä -> ~c"ae" ++ sanitize(tail)
      head when head == ?ö -> ~c"oe" ++ sanitize(tail)
      head when head == ?ü -> ~c"ue" ++ sanitize(tail)
      head when head == ?ß -> ~c"ss" ++ sanitize(tail)
      head -> sanitize(tail)

    
    
     
    # ä becomes ae
    # ö becomes oe
    # ü becomes ue
    # ß becomes ss

    # Please implement the sanitize/1 function
  end
end
end