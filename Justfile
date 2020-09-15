validate:
	dhall --file ./tests/fixtures/suite-3.dhall

test:
	cargo test

run:
	cargo run --bin cli