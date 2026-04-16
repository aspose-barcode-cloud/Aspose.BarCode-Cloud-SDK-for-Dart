.PHONY:	all
all:	lint	test

.PHONY: init
init:
	dart pub get

.PHONY:	lint
lint: init
	dart analyze --fatal-infos lib example

.PHONY:	test
test:
	dart test --chain-stack-traces
	dart example/main.dart
	./scripts/run_snippets.sh

.PHONY: format
format:
	dart format .

.PHONY: fix
fix: init
	dart fix --apply

.PHONY: format-doc
format-doc:
	# Trim trailing empty line
	sed -i -e '$${/^$$/d;}' README.md

.PHONY: after-gen
after-gen: fix insert-example format-doc
	./scripts/annotate-deprecated.bash
	@dart format .

.PHONY: insert-example
insert-example:
	./scripts/insert-example.bash

.PHONY: update
update:
	dart pub upgrade
	dart pub outdated

.PHONY: cover
cover:
	## Activate package `coverage` (if needed):
	# dart pub global activate coverage

	# Run Dart tests and output them at directory `./coverage`:
	dart run coverage:test_with_coverage

	# Generate HTML from LCOV report:
	# Install lcov with `brew install lcov` or `apt-get install lcov`
	genhtml ./coverage/lcov.info -o ./coverage/html

	# Open the HTML coverage report:
	ls ./coverage/report/index.html
