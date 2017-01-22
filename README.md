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
