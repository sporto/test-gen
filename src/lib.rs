use serde::{Deserialize, Serialize};
use serde_json::{Value};
use std::fs;

#[derive(Serialize, Deserialize, Debug)]
struct Test<input, out> {
    it: String,
    expected: out,
    input: input,
}

pub fn main() {
    match start() {
        Ok(deserialized_map) => {
            println!("{:?}", deserialized_map);
        }
        Err(e) => println!("{}", e),
    };
}

fn start() -> Result<Value, String> {
    read_file().and_then(|s| parse_dhall(&s))
}

fn read_file() -> Result<String, String> {
    let filename = "./tests/fixtures/suite.dhall";
    fs::read_to_string(filename).map_err(|e| format!("{:?}", e))
    // Ok("{ x = 1, y = 1 + 1 } : { x: Natural, y: Natural }".to_string())
}

fn parse_dhall(data: &str) -> Result<Value, String> {
    // println!("{}", data);
    serde_dhall::from_str(&data)
        .parse()
        .map_err(|e| format!("{:?}", e))
}
