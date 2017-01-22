#[macro_use] extern crate prettytable;
extern crate clap;
extern crate primate;

use prettytable::Table;
use prettytable::row::Row;
use clap::{ Arg, App };
use std::str::FromStr;

use primate::atkin;
use primate::matrix;


fn main() {
    let matches = App::new("primate")
                          .version("0.1.0")
                          .author("Arnau Siches <asiches@gmail.com>")
                          .about("Prints a table of N+1 x N+1 prime table")
                          .arg(Arg::with_name("number")
                               .help("Number of primes to generate the table.")
                               .required(true)
                               .index(1))
                               .get_matches();

    let number = usize::from_str(matches.value_of("number").unwrap());

    match number {
        Ok(n) if n > 0 => compose_table(n),
        _ => println!("The number must be bigger than 0."),
    };
}


/// Composes and prints an ASCII table with the N+1 x N+1 prime table.
fn compose_table(n: usize) {
    let mut table = Table::new();
    let mtx = matrix(atkin::sieve(n));

    for row in mtx {
        table.add_row(Row::new(row.iter().map(|x| cell!(x)).collect()));
    }

    table.printstd();
}
