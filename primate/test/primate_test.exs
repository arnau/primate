defmodule PrimateTest do
  use ExUnit.Case
  doctest Primate

  test "one prime" do
    assert Primate.Atkin.sieve(1) == [2]
  end

  test "two primes" do
    assert Primate.Atkin.sieve(2) == [2, 3]
  end

  test "three primes" do
    assert Primate.Atkin.sieve(3) == [2, 3, 5]
  end
end
