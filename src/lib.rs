pub mod atkin;


pub fn matrix(xs: Vec<usize>) -> Vec<Vec<usize>> {
    let mut matrix = vec![];
    let first_row = compose_row(0, xs.clone());
    matrix.push(first_row);

    for x in &xs {
        let row = compose_row(*x, xs.iter()
                                    .map(|y| x * y)
                                    .collect::<Vec<_>>());
        matrix.push(row);
    }

    matrix
}


fn compose_row(fst: usize, mut xs: Vec<usize>) -> Vec<usize> {
    xs.insert(0, fst);

    xs
}


#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn three_matrix() {
        let actual = matrix(vec![2, 3, 5]);
        let expected = vec![
            vec![0,  2,  3,  5],
            vec![2,  4,  6, 10],
            vec![3,  6,  9, 15],
            vec![5, 10, 15, 25],
        ];
        assert_eq!(actual, expected);
    }
}
