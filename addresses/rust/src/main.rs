use std::env;

fn main() {
    println!("Hi Planet");
    let args : Vec<_> = env::args().collect();
    if args.len() > 1{
        println!("Also passed with {:?}",args[1]);
    }
}
