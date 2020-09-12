use serde_json::json;
use serde_json::Value;

#[derive(Debug, PartialEq)]
enum AST {
    Text(String),
    Integer(i64),
    Call(String),
}

// Function call e.g. hello(1, "c")

fn function_call(fun_nam: &str, value: &Value) -> AST {
    AST::Call(fun_nam.to_string())
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_function_call() {
        let input = json!("sam");
        let res = function_call(&"hello", &input);
        assert_eq!(res, AST::Call("hello".into()));
    }

    // #[test]
    // fn test_function_list_strings() {
    //     let input = json!(["a", "b"]);
    //     let res = function_call(&"hello", &input);
    //     assert_eq!(res, AST::Call("hello".into()));
    // }
}
