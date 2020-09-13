validate:
	dhall --file ./tests/fixtures/suite-2.dhall

test:
	cargo test

run:
	cargo run --bin cli