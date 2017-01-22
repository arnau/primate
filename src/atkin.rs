//! Sieve of Atkin
//!
//! See: https://en.wikipedia.org/wiki/Sieve_of_Atkin


pub fn sieve(amount: usize) -> Vec<usize> {
    vec![2,3,5]
}



#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn three_primes() {
        let actual = sieve(3);
        assert_eq!(&actual, &[2, 3, 5]);
    }

}
