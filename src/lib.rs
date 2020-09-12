use serde::{Deserialize, Serialize};
use serde_json::Value;
use std::fs;

mod ast;
mod parser;

#[derive(Serialize, Deserialize, Debug)]
struct Test<Input, Out> {
    it: String,
    expected: Out,
    input: Input,
}

#[derive(Serialize, Deserialize, Debug)]
struct TestJson {
    it: String,
    expected: Value,
    input: Value,
}

pub fn main() {
    match start() {
        Ok(deserialized_map) => {
            // println!("{:?}", deserialized_map);
            println!("{:?}", "Done");
        }
        Err(e) => println!("{}", e),
    };
}

fn start() -> Result<Value, String> {
    let config: Value = read_config()?;
    let suite_name = get_suite_name(&config);
    println!("Suite name: {:?}", suite_name);

    let describes = config["describes"]
        .as_object()
        .ok_or_else(|| "Cannot find describes")?;

    for (key, value) in describes {
        println!("Describe: {:?}", key);
        let _describe_chunk = get_describe_chunk(value.clone());
    }

    Ok(config)
}

fn read_config() -> Result<Value, String> {
    read_file().and_then(|s| parse_dhall(&s))
}

fn read_file() -> Result<String, String> {
    let filename = "./tests/fixtures/suite.dhall";
    fs::read_to_string(filename).map_err(|e| format!("{:?}", e))
    // Ok("{ x = 1, y = 1 + 1 } : { x: Natural, y: Natural }".to_string())
}

fn parse_dhall(data: &str) -> Result<Value, String> {
    serde_dhall::from_str(&data)
        .parse()
        .map_err(|e| format!("{:?}", e))
}

fn get_suite_name(json: &Value) -> Option<&str> {
    json["name"].as_str()
}

fn get_describe_chunk(json_test_list: Value) -> Result<String, String> {
    let test_list: Vec<TestJson> =
        serde_json::from_value(json_test_list).map_err(|e| format!("{:?}", e))?;

    // let test_list: Vec<Value> =
    //     serde_json::from_value(json_test_list).map_err(|e| format!("{:?}", e))?;

    test_list.into_iter().map(|test| println!("{:?}", test.it));

    Ok("Ok".into())
}
