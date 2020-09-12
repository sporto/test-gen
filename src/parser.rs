use nom::bytes::complete::take;
use nom::number::complete::be_u16;
use nom::IResult;

#[test]
fn text_test() {
    assert_eq!(text("hello"), Ok(("", "Hello")));
}
