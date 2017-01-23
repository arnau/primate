# Primate

This project contains a library `primate` and an executable `primate`.  The
first porvides with a naive implementation of the Sieve of Atkin and the
second a command line interface that generates a prime table for the given
number `n`.


## Dependencies

* [Rust](https://www.rust-lang.org). Developed with v1.14.

To see the libraries used, check `Cargo.toml`.


## Usage

To compile the library and binary:

```sh
cargo build --release
```

To run the tests in debug mode:

```sh
cargo test
```

To run the benchmark tests:

```sh
cargo bench
```

Note: The bench tests are intense, expect them to take a while to finish. To
get an idea, this is what it took me last time:

```
running 3 tests
test ten_thousandth_prime    ... bench: 568,364,467 ns/iter (+/- 68,861,895)
test thousandth_prime        ... bench:   5,852,387 ns/iter (+/- 669,989)
test twenty_thousandth_prime ... bench: 2,290,393,798 ns/iter (+/- 357,915,197)

test result: ok. 0 passed; 0 failed; 0 ignored; 3 measured
```

To run the executable, either run:

```sh
cargo build --release
```

And then find the executable in `./target/release/primate`.  Its help should
be enough to explain how to use it.



## Process

The decision of using Rust is mainly for my convenience as it's the language
I'm using most of the time these days.  If I get some more time I will port
it to Elixir.  It would be nice to use the Rust library from Elixir to explore
interoperability between the two.

Given computing primes is not something I do often and the request states
“[...] that can generate a list of 20,000+ primes”.  I'm starting the task
by doing a bit of research of algorithms to find primes.

So far:

* [Sieve of Eratosthenes](https://en.wikipedia.org/wiki/Sieve_of_Eratosthenes).
* [Sieve of Atkin](https://en.wikipedia.org/wiki/Sieve_of_Atkin).


The Sieve of Atkin seems interesting so let's give it a go first.


After a bit more reading, probably the Sieve of Eratosthenes would've been a
better choice given the complexity involved in the Sieve of Atkin.  I'll stick
to Atkin given the tests run in less than 16s in debug mode, ~3s in release
mode.


### The Good, the Bad and the Ugly

I'm fairly pleased of the current state of the Sieve of Atkin implementation.
There is room for improvement to make it faster though.

The matrix generation is not good enough. It should generate unique values
and mirror them on display.
