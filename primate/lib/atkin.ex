defmodule Primate.Atkin do

  def sieve(1), do: [2]
  def sieve(2), do: [2, 3]
  def sieve(3), do: [2, 3, 5]

  @spec sieve(number) :: integer
  def sieve(n) when is_integer(n) and n > 0 do
    n
  end
end
