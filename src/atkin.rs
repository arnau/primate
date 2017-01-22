//! Sieve of Atkin
//!
//! See: https://en.wikipedia.org/wiki/Sieve_of_Atkin


pub fn sieve(amount: usize) -> Vec<usize> {
    match amount {
        0 => vec![],
        1 => vec![2],
        2 => vec![2, 3],
        3 => vec![2, 3, 5],
        _ => {
            let mut primes: Vec<usize> = vec![2, 3, 5];
            // Potential primes
            let xs = (2usize..).filter(by_modulo_sixty);

            primes
        }
    }
}


/// Atkin's algorithm sieves by applying modulo-sixty to a positive integer.
/// The reminder `r` determines what case should be applied, first, second or
/// third quadratic or it can be flagged as non prime.
fn by_modulo_sixty(n: &usize) -> bool {
    match *n % 60 {
        1 | 13 | 17 | 29 | 37 | 41 | 49 | 53 =>
            first_quadratic(n),

        7 | 19 | 31 | 43 =>
            second_quadratic(n),

        11 | 23 | 47 | 59 =>
            third_quadratic(n),

        _ => false,
    }
}


fn first_quadratic(n: &usize) -> bool {
    true
}

fn second_quadratic(n: &usize) -> bool {
    true
}

fn third_quadratic(n: &usize) -> bool {
    true
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
    fn two_prime() {
        let actual = sieve(2);
        assert_eq!(&actual, &[2, 3]);
    }

    #[test]
    fn three_primes() {
        let actual = sieve(3);
        assert_eq!(&actual, &[2, 3, 5]);
    }
}
