use std::collections::BTreeMap;

pub fn main() {
    match read_file() {
        Ok(data) => {
            // let deserialized_map: BTreeMap<String, usize> = serde_dhall::from_str(&data).parse().unwrap();
            // println!("{:?}", deserialized_map)
            parse_dhall(&data);
        }
        Err(_) =>
            println!("Fail!")
    };
}

fn read_file() -> Result<String, String> {
    Ok("{ x = 1, y = 1 + 1 } : { x: Natural, y: Natural }".to_string())
}

fn parse_dhall(data: &str) -> Result<String, String> {
    let deserialized_map: BTreeMap<String, usize> = serde_dhall::from_str(&data)
        .parse()
        .map_err(|e| format!("{:?}", e))?;

    println!("{:?}", deserialized_map);
    Ok("Ok".to_string())
}
