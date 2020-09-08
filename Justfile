validate:
	dhall --file ./tests/fixtures/hello.dhall

run:
	cargo run --bin cli