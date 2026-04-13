---
name: generate-and-scan-barcode-dart
description: Write or update Dart or Flutter code that uses the Aspose BarCode Cloud SDK (`package:aspose_barcode_cloud/aspose_barcode_cloud.dart`; pub package `aspose_barcode_cloud`) to generate, recognize, or scan barcodes through Aspose's cloud REST API. Use this skill whenever the user wants barcode work in Dart or Flutter, touches files under `submodules/dart`, or mentions `ApiClient`, `Configuration`, `GenerateApi`, `RecognizeApi`, `ScanApi`, `GenerateParams`, `RecognizeBase64Request`, or `ScanBase64Request`. The SDK has several easy-to-miss idioms - `Uint8List` return values, `ApiClient(Configuration(...))` setup, GET recognize or scan requiring a public `fileUrl`, base64 methods expecting caller-encoded data, `Configuration.fromEnv` only reading `ACCESS_TOKEN`, and repo scripts that should run through WSL on Windows - so consult this skill instead of guessing.
---

# Generate and scan barcode in Dart

The Dart SDK is a thin generated client over the Aspose BarCode Cloud REST API. Most tasks boil down to choosing the right API class (`GenerateApi`, `RecognizeApi`, `ScanApi`), picking the right transport variant (GET, body or base64, or multipart), and setting up `ApiClient(Configuration(...))` correctly.

Import the pub package `aspose_barcode_cloud`, then use the exported types from `package:aspose_barcode_cloud/aspose_barcode_cloud.dart`.

## Quick start

Use this import in most examples:

```dart
import 'package:aspose_barcode_cloud/aspose_barcode_cloud.dart';
```

Prefer this setup:

```dart
final client = ApiClient(Configuration(
  clientId: clientId,
  clientSecret: clientSecret,
));

final generateApi = GenerateApi(client);
final recognizeApi = RecognizeApi(client);
final scanApi = ScanApi(client);
```

If the task is repo maintenance inside `submodules/dart`, read `references/repo-workflow.md`. If the task needs the closest existing example or snippet, read `references/snippet-map.md`.

## Authentication

Use one of these two patterns:

1. Let the SDK fetch OAuth tokens for you.

```dart
final client = ApiClient(Configuration(
  clientId: clientId,
  clientSecret: clientSecret,
));
```

2. Inject a pre-fetched bearer token.

```dart
final client = ApiClient(Configuration(
  accessToken: accessToken,
));
```

`ApiClient` always creates `OAuth` internally. If neither `(clientId, clientSecret)` nor `accessToken` is present, construction fails with `ApiException(0, "clientId and clientSecret or accessToken required")`.

Inside this repo, tests use:

```dart
final config =
    Configuration.load('test/configuration.json') ??
    Configuration.fromEnv(prefix: 'TEST_CONFIGURATION_');
```

`Configuration.fromEnv` currently reads only `TEST_CONFIGURATION_ACCESS_TOKEN`. It does not populate `clientId` or `clientSecret`, so mirror that behavior when you need test-compatible setup.

## Choose the right API shape

Pick the operation first:

- `GenerateApi`: create a barcode image.
- `RecognizeApi`: decode one or more expected barcode types and optionally tune recognition.
- `ScanApi`: auto-detect barcode types with the smallest API surface.

Then pick the transport variant:

- Public internet URL: use `recognize(...)` or `scan(...)`. `fileUrl` must be publicly reachable, not a local path.
- Local bytes already loaded into memory: use `recognizeMultipart(...)` or `scanMultipart(...)`.
- Raw bytes that must go in a JSON body: base64-encode them yourself and use `recognizeBase64(...)` or `scanBase64(...)`.
- Simple generation with query-style options: use `generate(...)`.
- Structured generation payload: use `generateBody(...)`.
- Multipart generation: use `generateMultipart(...)` only when the caller explicitly needs multipart form submission.

Key method names:

- `generate`
- `generateBody`
- `generateMultipart`
- `recognize`
- `recognizeBase64`
- `recognizeMultipart`
- `scan`
- `scanBase64`
- `scanMultipart`

## Non-obvious SDK rules

1. `generate`, `generateBody`, and `generateMultipart` return `Uint8List`, not `File` or `Stream`. Save the bytes yourself with `File(...).writeAsBytes(...)` if the caller wants a file.
2. `recognizeBase64` and `scanBase64` expect an already-encoded base64 string in `RecognizeBase64Request.fileBase64` or `ScanBase64Request.fileBase64`. Call `base64Encode(bytes)` yourself first.
3. `RecognizeBase64Request` takes `List<DecodeBarcodeType>`, but `recognize(...)` and `recognizeMultipart(...)` take a single `DecodeBarcodeType`.
4. `scan` and `scanMultipart` never take barcode types or recognition-quality knobs. Use `RecognizeApi` when the caller needs that control.
5. GET recognize and scan methods only work with public URLs. For local files or in-memory bytes, do not pass a filesystem path to `fileUrl`.
6. `BarcodeResponseList.barcodes` can contain multiple results. Iterate it instead of assuming index `0` is the only barcode.
7. API failures throw `ApiException`. Use `e.code`, `e.message`, and `e.getDetails()` when the caller needs HTTP status or server-side validation details.
8. `Configuration.fromEnv` is narrower than the JSON loader: `Configuration.load(...)` reads `clientId`, `clientSecret`, `basePath`, `tokenUrl`, and `accessToken`, but `fromEnv(...)` currently fills only `accessToken`.
9. The package supports Dart and Flutter, but examples that use `dart:io` file APIs are not portable to Flutter web. Keep that distinction clear when writing snippets.

## Common patterns

Generate and save a QR code:

```dart
import 'dart:io';
import 'dart:typed_data';

import 'package:aspose_barcode_cloud/aspose_barcode_cloud.dart';

Future<void> main() async {
  final client = ApiClient(Configuration(
    clientId: clientId,
    clientSecret: clientSecret,
  ));

  final api = GenerateApi(client);
  final Uint8List image = await api.generate(
    EncodeBarcodeType.QR,
    'hello from Dart',
    imageFormat: BarcodeImageFormat.Png,
    textLocation: CodeLocation.None,
  );

  await File('qr.png').writeAsBytes(image);
}
```

Recognize specific barcode types from bytes already in memory:

```dart
import 'dart:convert';
import 'dart:io';

import 'package:aspose_barcode_cloud/aspose_barcode_cloud.dart';

Future<void> main() async {
  final bytes = await File('many-types.png').readAsBytes();

  final request = RecognizeBase64Request(
    [DecodeBarcodeType.QR, DecodeBarcodeType.Code128],
    base64Encode(bytes),
    RecognitionMode.Fast,
    RecognitionImageKind.ClearImage,
  );

  final result = await RecognizeApi(client).recognizeBase64(request);
  for (final barcode in result.barcodes) {
    print('${barcode.type}: ${barcode.barcodeValue}');
  }
}
```

Auto-scan a local image without specifying the barcode type:

```dart
import 'dart:io';

import 'package:aspose_barcode_cloud/aspose_barcode_cloud.dart';

Future<void> main() async {
  final bytes = await File('unknown.png').readAsBytes();
  final result = await ScanApi(client).scanMultipart(bytes);

  for (final barcode in result.barcodes) {
    print('${barcode.type}: ${barcode.barcodeValue}');
  }
}
```

## Working in this repo

Read `references/repo-workflow.md` when the task changes SDK source, tests, snippets, README example insertion, package metadata, or generated code in `submodules/dart`.

Read `references/snippet-map.md` when the task needs the closest existing pattern for generate, recognize, scan, auth, or test setup.

## Final checklist

1. Use `package:aspose_barcode_cloud/aspose_barcode_cloud.dart` and build APIs from `ApiClient(Configuration(...))`.
2. Choose credential mode deliberately: `(clientId, clientSecret)` for SDK-managed tokens or `accessToken` for pre-fetched bearer tokens.
3. Pick GET only for public `fileUrl`s, multipart for local bytes, and base64 body variants when JSON transport is required.
4. Base64-encode image bytes yourself before calling `recognizeBase64` or `scanBase64`.
5. Save generate results yourself because the SDK returns `Uint8List`.
6. Iterate `result.barcodes` instead of assuming a single barcode.
7. When changing the repo, validate with the submodule workflow in `references/repo-workflow.md`.
