#![feature(test)]
extern crate test;
extern crate primate;

use primate::*;
use test::Bencher;


#[bench]
fn thousand_primes(b: &mut Bencher) {
    b.iter(|| atkin::sieve(1_000));
}

#[bench]
fn ten_thousand_primes(b: &mut Bencher) {
    b.iter(|| atkin::sieve(10_000));
}

#[bench]
fn twenty_thousand_primes(b: &mut Bencher) {
    b.iter(|| atkin::sieve(20_000));
}
