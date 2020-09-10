validate:
	dhall --file ./tests/fixtures/suite.dhall

run:
	cargo run --bin cli