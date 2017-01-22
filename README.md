# Process

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


# Benchmark tests

```
$ cargo bench
Compiling primate v0.1.0 (file:///Users/arnau/kitchen/me/lab/rustlab/primate)
Finished release [optimized] target(s) in 0.97 secs
Running target/release/deps/atkin-6d34849fa49a431f

running 3 tests
test ten_thousandth_prime    ... bench: 568,364,467 ns/iter (+/- 68,861,895)
test thousandth_prime        ... bench:   5,852,387 ns/iter (+/- 669,989)
test twenty_thousandth_prime ... bench: 2,290,393,798 ns/iter (+/- 357,915,197)

test result: ok. 0 passed; 0 failed; 0 ignored; 3 measured
```
