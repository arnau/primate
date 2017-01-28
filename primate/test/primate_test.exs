defmodule PrimateTest do
  use ExUnit.Case
  doctest Primate

  test "first quadratic" do
    assert Primate.Atkin.first_quadratic(13) == true
    assert Primate.Atkin.first_quadratic(17) == true
  end

  test "one prime" do
    assert Primate.Atkin.sieve(1) == [2]
  end

  test "two primes" do
    assert Primate.Atkin.sieve(2) == [2, 3]
  end

  test "three primes" do
    assert Primate.Atkin.sieve(3) == [2, 3, 5]
  end

  test "four primes" do
    assert Primate.Atkin.sieve(4) == [2, 3, 5, 7]
  end

  test "twenty primes" do
    assert Primate.Atkin.sieve(20) == [2, 3, 5, 7, 11, 13, 17, 19, 23, 29,
                                       31, 37, 41, 43, 47, 53, 59, 61, 67, 71]
  end

  test "fourty primes" do
    assert Primate.Atkin.sieve(40) == [2, 3, 5, 7, 11, 13, 17, 19, 23, 29,
                                       31, 37, 41, 43, 47, 53, 59, 61, 67, 71,
                                       73, 79, 83, 89, 97, 101, 103, 107, 109,
                                       113, 127, 131, 137, 139, 149, 151, 157,
                                       163, 167, 173]
  end

  test "thousandth prime" do
    assert Primate.Atkin.sieve(1000) |> List.last == 7919
  end

  @tag :slow
  test "twenty thousandth prime" do
    assert Primate.Atkin.sieve(20_000) |> List.last == 224_737
  end

  @tag :alt
  @tag :slow
  test "alt twenty thousandth prime" do
    assert Primate.Atkin.sieve_alt(20_000) |> List.last == 224_737
  end

  @tag :alt
  test "alt forth prime" do
    assert Primate.Atkin.sieve_alt(4) |> List.last == 7
  end
end
