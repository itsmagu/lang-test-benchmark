fn main() {
    
    // Crazy that rust needs the 0.0 and does not just eat up a 0 here :/
    let mut x:f32 = 0.0;
    let mut y:f32 = 0.0;
    let mut z:f32 = 0.0;
    let mut dim:i32;
    let mut offset:i32;

    for _ in 0..6 {
        for _ in 0..12 {
            x += 1.0; // 1.0? :/
            y += x;
            z *= x*y;
        }
        dim = (x+y) as i32; // Atleast I could google this :)
        offset = x as i32 * dim;
        z = (dim + (2/dim)) as f32;

        println!("{x} {y} {z} {dim} {offset}");
    }
}
