validate:
	dhall --file ./tests/fixtures/suite.dhall

test:
	cargo test

run:
	cargo run --bin cli