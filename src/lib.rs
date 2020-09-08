use std::collections::BTreeMap;


pub fn main() {
    // Some Dhall data
    let data = "{ x = 1, y = 1 + 1 } : { x: Natural, y: Natural }";
    // Deserialize it to a Rust type.
    let deserialized_map: BTreeMap<String, usize> = serde_dhall::from_str(data).parse().unwrap();

    println!("{:?}", deserialized_map);
    println!("Hello, world!");
}
