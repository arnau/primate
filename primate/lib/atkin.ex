defmodule Primate.Atkin do
  @moduledoc """
  Provides a Sieve of Atkin implementation.

  ## Examples

      iex> Primate.Atkin.sieve(4)
      [2, 3, 5, 7]

  See: https://en.wikipedia.org/wiki/Sieve_of_Atkin
  """

  def sieve(1), do: [2]
  def sieve(2), do: [2, 3]
  def sieve(3), do: [2, 3, 5]

  @doc """
  Generates the requested amount of prime numbers.
  """
  @spec sieve(integer) :: [integer]
  def sieve(amount) when is_integer(amount) and amount > 0 do
      Enum.reduce_while(potential_primes(), [2, 3, 5], fn (x, acc) ->
        if length(acc) < amount do
          if Enum.any?(acc, fn(p) -> rem(x, p) == 0 end) do
            {:cont, acc}
          else
            {:cont, List.insert_at(acc, -1, x)}
          end
        else
          {:halt, acc}
        end
      end)
  end

  @spec potential_primes :: [integer]
  defp potential_primes do
    Stream.filter(Stream.iterate(2, &(&1 + 1)), &by_modulo_sixty/1)
  end

  @spec by_modulo_sixty(integer) :: boolean
  def by_modulo_sixty(n) do
    case rem(n, 60) do
        r when r in [1, 13, 17, 29, 37, 41, 49, 53] ->
            first_quadratic(n)

        r when r in [7, 19, 31, 43] ->
            second_quadratic(n)

        r when r in [11, 23, 47, 59] ->
            third_quadratic(n)

        _ -> false
    end
  end

  @spec first_quadratic(integer) :: boolean
  def first_quadratic(n) do
    limit = round(:math.sqrt((n - 1) / 4))

    counter = Enum.reduce(1..limit, 0, fn (x, acc) ->
      z = n - 4.0 * :math.pow(x, 2)
      z = if z < 0, do: z * -1, else: z

      y = :math.sqrt(z)

      if has_fraction(y), do: acc, else: acc + 1
    end)

    rem(counter, 2) != 0
  end

  @spec second_quadratic(integer) :: boolean
  def second_quadratic(n) do
    limit = round(:math.sqrt((n - 1) / 3))

    counter = Enum.reduce(1..limit, 0, fn (x, acc) ->
      z = n - 3.0 * :math.pow(x, 2)
      z = if z < 0, do: z * -1, else: z

      y = :math.sqrt(z)

      if has_fraction(y), do: acc, else: acc + 1
    end)

    rem(counter, 2) != 0
  end

  @spec third_quadratic(integer) :: boolean
  def third_quadratic(n) do
    limit = round(:math.sqrt((3 + 2 * n) / 4.0) - 0.5)

    counter = Enum.reduce(1..limit, 0, fn (x, acc) ->
      z = (3 * :math.pow(x, 2)) - n

      if z < 0 do
        acc
      else
        y = :math.sqrt(z)

        if has_fraction(y), do: acc, else: acc + 1
      end
    end)

    rem(counter, 2) != 0
  end

  @spec has_fraction(number) :: boolean
  defp has_fraction(n) do
    n != trunc(n)
  end
end
