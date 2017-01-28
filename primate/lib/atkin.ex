defmodule Primate.Atkin do
  @moduledoc """
  Provides a Sieve of Atkin implementation.

  ## Examples

      iex> Primate.Atkin.sieve(4)
      [2, 3, 5, 7]

  See: https://en.wikipedia.org/wiki/Sieve_of_Atkin
  """

  @doc """
  Generates the requested amount of prime numbers.

  This is an alternative approach which seems to be slightly slower.
  """
  @spec sieve_alt(integer) :: integer
  def sieve_alt(amount) when is_integer(amount) and amount > 0 do
    Enum.take(prime_stream(), amount)
  end

  @spec prime_stream :: [integer]
  def prime_stream do
    Stream.concat([2, 3, 5], Stream.unfold([5], &prime_gen/1))
  end

  defp prime_gen(acc) do
    x = next_prime(acc)

    {x, List.insert_at(acc, -1, x)}
  end

  @spec next_prime([integer]) :: integer
  def next_prime(primes) do
    primes
      |> List.last
      |> Stream.iterate(&(&1 + 1))
      |> Stream.filter(&by_modulo_sixty/1)
      |> Stream.drop_while(&(Enum.any?(primes, fn(p) -> rem(&1, p) == 0 end)))
      |> Enum.take(1)
      |> List.first
  end

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
