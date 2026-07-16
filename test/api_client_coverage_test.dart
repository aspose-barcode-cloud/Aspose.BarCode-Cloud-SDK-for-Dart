// Offline coverage for the `ApiClient` (de)serialization and `api_helper`.
//
// Split out of `generated_model_coverage_test.dart` (which mirrors the
// Python SDK's `test_generated_coverage.py` and the Java SDK's
// `SdkCoreCoverageTest`):
// it exercises the network-free request/response marshalling layer —
// `ApiClient.serialize`/`deserialize` type dispatch (primitives, models,
// enums, collections and `ApiException` wrapping of failures) and the
// `api_helper` parameter formatting functions — to raise core line coverage.
//
// The `lib/src/api/` classes are only exercised by the live `*_api_test.dart`
// suites (ApiClient constructs its own `Http.Client`, so they cannot be
// covered offline), which means the 80% gate in `scripts/coverage.sh` (and
// therefore `make cover`) still requires live API credentials to pass.
//
// ignore_for_file: non_constant_identifier_names

import 'package:aspose_barcode_cloud/aspose_barcode_cloud.dart';
import 'package:aspose_barcode_cloud/src/api_helper.dart';
import 'package:test/test.dart';

import 'coverage_fixtures.dart';

void main() {
  group('ApiClient offline helpers', () {
    final client = ApiClient(Configuration(accessToken: 'fake-token'));

    test('addDefaultHeader and serialize', () {
      client.addDefaultHeader('X-Test', 'value');
      expect(client.serialize(null), equals(''));
      final serialized = client.serialize(regionPoint());
      expect(serialized, contains('"x":10'));
    });

    test('deserialize primitives', () {
      expect(client.deserialize('hello', 'String'), equals('hello'));
      expect(client.deserialize('123', 'int'), equals(123));
      expect(client.deserialize('1.5', 'double'), equals(1.5));
      expect(client.deserialize('true', 'bool'), isTrue);
    });

    test('deserialize models and enums', () {
      final region =
          client.deserialize('{"x":10,"y":20}', 'RegionPoint') as RegionPoint;
      expect(region.x, equals(10));
      expect(region.y, equals(20));

      final fmt = client.deserialize('"Png"', 'BarcodeImageFormat')
          as BarcodeImageFormat;
      expect(fmt.toJson(), equals('Png'));

      final list = client.deserialize('[1, 2, 3]', 'List<int>') as List;
      expect(list, equals([1, 2, 3]));

      final map =
          client.deserialize('{"a": 1, "b": 2}', 'Map<String, int>') as Map;
      expect(map['a'], equals(1));

      final points = client.deserialize(
          '[{"x":1,"y":2},{"x":3,"y":4}]', 'List<RegionPoint>') as List;
      expect(points, hasLength(2));
      expect((points[0] as RegionPoint).x, equals(1));
    });

    test('deserialize wraps failures in ApiException', () {
      expect(
        () => client.deserialize('"BadEnumValue"', 'BarcodeImageFormat'),
        throwsA(isA<ApiException>()),
      );
      expect(
        () => client.deserialize('123', 'NotARealType'),
        throwsA(isA<ApiException>()),
      );
    });
  });

  group('api_helper', () {
    test('QueryParam holds name and value', () {
      final param = QueryParam('name', 'value');
      expect(param.name, equals('name'));
      expect(param.value, equals('value'));
    });

    test('parameterToString handles null, DateTime and plain values', () {
      expect(parameterToString(null), equals(''));
      expect(parameterToString(42), equals('42'));
      final date = DateTime.utc(2026, 6, 29, 1, 2, 3);
      expect(parameterToString(date), equals(date.toUtc().toIso8601String()));
    });

    test('convertParametersForCollectionFormat covers every branch', () {
      expect(convertParametersForCollectionFormat('csv', '', 'x'), isEmpty);
      expect(
          convertParametersForCollectionFormat('csv', 'name', null), isEmpty);

      final single =
          convertParametersForCollectionFormat('csv', 'name', 'value').toList();
      expect(single, hasLength(1));
      expect(single[0].value, equals('value'));

      final multi =
          convertParametersForCollectionFormat('multi', 'name', ['a', 'b'])
              .toList();
      expect(multi, hasLength(2));

      expect(
          convertParametersForCollectionFormat('csv', 'n', ['a', 'b'])
              .first
              .value,
          equals('a,b'));
      expect(
          convertParametersForCollectionFormat('ssv', 'n', ['a', 'b'])
              .first
              .value,
          equals('a b'));
      expect(
          convertParametersForCollectionFormat('tsv', 'n', ['a', 'b'])
              .first
              .value,
          equals('a\tb'));
      expect(
          convertParametersForCollectionFormat('pipes', 'n', ['a', 'b'])
              .first
              .value,
          equals('a|b'));
      expect(
          convertParametersForCollectionFormat('', 'n', ['a', 'b']).first.value,
          equals('a,b'));
      expect(
          convertParametersForCollectionFormat('unknown', 'n', ['a', 'b'])
              .first
              .value,
          equals('a,b'));
    });
  });
}
