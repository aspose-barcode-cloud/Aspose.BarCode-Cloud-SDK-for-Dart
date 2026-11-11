// Offline tests that query parameters reach the server unchanged, whatever
// characters they contain.

import 'package:aspose_barcode_cloud/aspose_barcode_cloud.dart';
import 'package:test/test.dart';

import 'loopback_api.dart';

void main() {
  late LoopbackApi api;
  late ApiClient client;

  setUpAll(() async {
    api = await LoopbackApi.start();
    client = ApiClient(api.tokenConfiguration());
  });

  tearDownAll(() async {
    client.close();
    await api.close();
  });

  setUp(() => api.reset());

  const reservedCharacters = ' &=+#%?/:;,@\$!\'()*[]';

  group('ApiClient query string', () {
    test('a URL with its own query and fragment stays one value', () async {
      const fileUrl = 'https://example.com/a b+c.png?x=1&y=2#frag%41';

      await ScanApi(client).scan(fileUrl);

      expect(api.uris.single.queryParametersAll['fileUrl'], equals([fileUrl]));
      expect(api.uris.single.queryParametersAll, hasLength(1));
    });

    test('reserved and non-ASCII characters in text survive', () async {
      const text = 'Tom & Jerry $reservedCharacters Ünïcødé 条码';

      await GenerateApi(client).generate(EncodeBarcodeType.QR, text);

      expect(api.uris.single.queryParametersAll['data'], equals([text]));
    });

    test('a value that is already percent-encoded is not decoded', () async {
      const fileUrl = 'https://example.com/a%20b.png';

      await ScanApi(client).scan(fileUrl);

      expect(api.uris.single.queryParameters['fileUrl'], equals(fileUrl));
    });
  });
}
