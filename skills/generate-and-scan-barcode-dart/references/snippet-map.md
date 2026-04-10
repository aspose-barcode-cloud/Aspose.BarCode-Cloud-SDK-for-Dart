# Snippet and example map

Use this reference when you want the closest existing pattern before writing new Dart or Flutter SDK code or when updating docs, snippets, and examples.

## Small end-user examples

- `example/main.dart`: minimal generate-then-scan flow with local file save.
- `snippets/manual_fetch_token.dart`: manual OAuth client-credentials token fetch without the SDK.

## Generate patterns

- `snippets/generate/save/generate_get.dart`: simple `generate(...)` and save-to-file flow.
- `snippets/generate/save/generate_body.dart`: `generateBody(...)` with `GenerateParams`.
- `snippets/generate/save/generate_multipart.dart`: multipart generation flow.
- `snippets/generate/set_text/*`: `EncodeData` and `EncodeDataType` examples.
- `snippets/generate/set_size/*`: width, height, resolution, and units examples.
- `snippets/generate/set_colorscheme/*`: foreground and background color examples.
- `snippets/generate/appearance/*`: richer `BarcodeImageParams` examples.

## Recognize and scan patterns

- `snippets/read/set_source/recognize_get.dart`: recognize from a public URL.
- `snippets/read/set_source/recognize_multipart.dart`: recognize from local bytes.
- `snippets/read/set_source/recognize_body.dart`: recognize from base64 body.
- `snippets/read/set_source/scan_get.dart`: auto-scan from a public URL.
- `snippets/read/set_source/scan_multipart.dart`: auto-scan from local bytes.
- `snippets/read/set_source/scan_body.dart`: auto-scan from base64 body.
- `snippets/read/set_target_types/*`: choosing one or several `DecodeBarcodeType` values.
- `snippets/read/set_quality/*`: `RecognitionMode` examples.
- `snippets/read/set_image_kind/*`: `RecognitionImageKind` examples.

## Tests worth copying

- `test/generate_api_test.dart`: generate via GET, body, and multipart.
- `test/recognize_api_test.dart`: recognize via base64 body, multipart, and URL.
- `test/scan_api_test.dart`: scan via base64 body, multipart, and URL.
- `test/configuration_test.dart`: config save and load behavior.
- `test/exception_test.dart`: expected `ApiException` behavior and `getDetails()`.
- `test/test_config.dart`: shared client construction used by tests.
