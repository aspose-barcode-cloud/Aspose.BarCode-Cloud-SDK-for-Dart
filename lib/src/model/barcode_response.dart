// ignore_for_file: non_constant_identifier_names
// ignore_for_file: deprecated_member_use_from_same_package
import '../../aspose_barcode_cloud.dart';

/// Represents information about a barcode.
class BarcodeResponse {
  /// Barcode data.

  String? barcodeValue;

  /// Type of the barcode.

  String? type;

  /// Region with the barcode.

  List<RegionPoint>? region;

  /// Checksum of the barcode.

  String? checksum;

  /// Constructor
  BarcodeResponse([this.barcodeValue, this.type, this.region, this.checksum]);

  @override
  String toString() {
    return 'BarcodeResponse[barcodeValue=$barcodeValue, type=$type, region=$region, checksum=$checksum, ]';
  }

  /// Creates a BarcodeResponse instance from a JSON representation.
  BarcodeResponse.fromJson(Map<String, dynamic> json) {
    barcodeValue = json['barcodeValue'];
    type = json['type'];
    region = json['region'] == null
        ? null
        : RegionPoint.listFromJson(json['region']);
    checksum = json['checksum'];
  }

  /// Returns a JSON representation of BarcodeResponse.
  Map<String, dynamic> toJson() {
    return {
      'barcodeValue': barcodeValue,
      'type': type,
      'region': region,
      'checksum': checksum
    };
  }

  /// Converts a list of JSON objects to a list of BarcodeResponse instances.
  ///
  /// @param json The list of JSON objects to convert.
  /// @return A list of BarcodeResponse instances.
  static List<BarcodeResponse> listFromJson(List<dynamic> json) {
    return json.map((value) => BarcodeResponse.fromJson(value)).toList();
  }
}
