// ignore_for_file: non_constant_identifier_names
// ignore_for_file: deprecated_member_use_from_same_package
import '../../aspose_barcode_cloud.dart';

/// Represents information about a barcode list.
class BarcodeResponseList {
  /// List of barcodes that are present in the image.

  late List<BarcodeResponse> barcodes;

  /// Constructor
  BarcodeResponseList(
    this.barcodes,
  );

  @override
  String toString() {
    return 'BarcodeResponseList[barcodes=$barcodes, ]';
  }

  /// Creates a BarcodeResponseList instance from a JSON representation.
  BarcodeResponseList.fromJson(Map<String, dynamic> json) {
    barcodes = BarcodeResponse.listFromJson(json['barcodes']);
  }

  /// Returns a JSON representation of BarcodeResponseList.
  Map<String, dynamic> toJson() {
    return {'barcodes': barcodes};
  }

  /// Converts a list of JSON objects to a list of BarcodeResponseList instances.
  ///
  /// @param json The list of JSON objects to convert.
  /// @return A list of BarcodeResponseList instances.
  static List<BarcodeResponseList> listFromJson(List<dynamic> json) {
    return json.map((value) => BarcodeResponseList.fromJson(value)).toList();
  }
}
