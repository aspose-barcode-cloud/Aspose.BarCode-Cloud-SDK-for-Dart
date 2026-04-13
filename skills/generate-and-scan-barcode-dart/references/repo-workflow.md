# Dart submodule workflow

Use this reference when the task edits SDK source, tests, snippets, docs, pubspec metadata, or generated files inside `submodules/dart`.

## Layout

- `lib/aspose_barcode_cloud.dart`: public export barrel.
- `lib/src/api`: generated API clients such as `GenerateApi`, `RecognizeApi`, and `ScanApi`.
- `lib/src/model`: request and response models plus enums.
- `lib/src/auth`: `authentication.dart` and OAuth token handling.
- `lib/src/http`: multipart helpers and byte-stream utilities.
- `lib/src/configuration.dart`, `lib/src/api_client.dart`, `lib/src/api_exception.dart`: configuration, HTTP plumbing, serialization, and errors.
- `doc/api` and `doc/models`: generated Markdown docs.
- `example/main.dart`: standalone sample that generates then scans a barcode.
- `snippets`: documentation snippets executed by the snippet runner.
- `scripts`: README insertion, snippet execution, badge checks, and post-processing helpers.
- `test`: configuration, exception, generate, recognize, and scan coverage.
- `Makefile`, `pubspec.yaml`: validation commands, package metadata, and dependencies.

## Validation

On Windows, run repo scripts and Make targets through WSL.

From `submodules/dart`:

- `make init`
- `make lint`
- `make test`
- `make format`
- `make fix`

`make test` does more than unit tests:

- runs `dart test --chain-stack-traces`
- runs `dart example/main.dart`
- runs `./scripts/run_snippets.sh`

`run_snippets.sh` creates `snippets_test`, copies credentials into each snippet via `scripts/insert-credentials.py`, runs every snippet with `dart`, and removes the temp directory. Treat snippet failures as package-consumer regressions, not just docs breakage.

`make after-gen` runs `fix` and `insert-example`, then `./scripts/annotate-deprecated.bash`, then `dart format .`. The root-level `make dart` path ends by calling `make after-gen` in the submodule.

## Test configuration

- Minimal JSON shape lives in `test/configuration.example.json`.
- Tests load `test/configuration.json` first, then fall back to `Configuration.fromEnv(prefix: "TEST_CONFIGURATION_")`.
- Current `Configuration.fromEnv` only reads `TEST_CONFIGURATION_ACCESS_TOKEN`.
- If a test or snippet needs `clientId` and `clientSecret`, prefer a JSON config file; environment variables with those names are not read by the current implementation.
- `example/main.dart` and many snippets use placeholder client credentials plus `TEST_CONFIGURATION_ACCESS_TOKEN` for CI-compatible execution.

## Regenerated code workflow

If you change generated SDK code in this mono-repo:

1. Make the desired SDK edit in `submodules/dart` so the target behavior is clear.
2. Mirror the change in the matching template under `codegen/Templates/dart`. If the relevant template is missing locally, copy it in from the upstream OpenAPI Generator templates first and edit the local copy.
3. Stage the Dart submodule changes.
4. From the repo root, run `make dart` through WSL on Windows.
5. `codegen/generate-dart.bash` regenerates into `.generated/dart`, moves `README.md` to `README.template`, refreshes `pubspec.yaml`, `.gitignore`, `lib`, `doc`, and helper scripts, then runs `make after-gen` in `submodules/dart`.
6. Ensure `submodules/dart` has no new unstaged diffs after regeneration.
7. If regeneration reintroduces old code, keep fixing the templates until generated output matches the intended SDK change.

## Useful anchors

- `lib/src/configuration.dart`: config loading, defaults, and the narrow `fromEnv` behavior.
- `lib/src/api_client.dart`: auth setup, serialization, and HTTP invocation.
- `lib/src/api/generate_api.dart`, `lib/src/api/recognize_api.dart`, `lib/src/api/scan_api.dart`: public method signatures and transport variants.
- `test/test_config.dart`: repo auth fallback rules.
- `scripts/run_snippets.sh`: snippet execution pipeline.
- `scripts/insert-example.bash` and `scripts/insert-example.dart`: README generation entry points.
- `codegen/generate-dart.bash`: main regen script for this submodule.
