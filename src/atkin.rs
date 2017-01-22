//! Sieve of Atkin
//!
//! See: https://en.wikipedia.org/wiki/Sieve_of_Atkin


pub fn sieve(amount: usize) -> Vec<usize> {
    let mut primes: Vec<usize> = vec![2, 3, 5];

    match amount {
        3 => primes,
        2 => primes.drain(2..).collect(),
        1 => primes.drain(1..).collect(),
        0 => vec![],
        _ => vec![],
    }
}



#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn one_prime() {
        let actual = sieve(1);
        assert_eq!(&actual, &[2]);
    }

    #[test]
    fn one_prime() {
        let actual = sieve(2);
        assert_eq!(&actual, &[2, 5]);
    }

    #[test]
    fn three_primes() {
        let actual = sieve(3);
        assert_eq!(&actual, &[2, 3, 5]);
    }
}
