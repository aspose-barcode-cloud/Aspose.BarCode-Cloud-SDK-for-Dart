// ignore_for_file: non_constant_identifier_names
// ignore_for_file: deprecated_member_use_from_same_package
import '../../aspose_barcode_cloud.dart';

/// Batch barcode generation request.
class BatchGenerateRequest {
  /// Format of the returned archive. Default value: Zip.
  //enum archiveFormatEnum {  Zip,  Tar,  TarGzip,  };
  BatchArchiveFormat? archiveFormat;

  /// Barcodes to generate. A batch must contain between one and three items.

  late List<BatchGenerateItem> items;

  /// Constructor
  BatchGenerateRequest(this.items, [this.archiveFormat]);

  @override
  String toString() {
    return 'BatchGenerateRequest[archiveFormat=$archiveFormat, items=$items, ]';
  }

  /// Creates a BatchGenerateRequest instance from a JSON representation.
  BatchGenerateRequest.fromJson(Map<String, dynamic> json) {
    archiveFormat = json['archiveFormat'] == null
        ? null
        : BatchArchiveFormat.fromJson(json['archiveFormat']);
    items = BatchGenerateItem.listFromJson(json['items']);
  }

  /// Returns a JSON representation of BatchGenerateRequest.
  Map<String, dynamic> toJson() {
    return {'archiveFormat': archiveFormat, 'items': items};
  }

  /// Converts a list of JSON objects to a list of BatchGenerateRequest instances.
  ///
  /// @param json The list of JSON objects to convert.
  /// @return A list of BatchGenerateRequest instances.
  static List<BatchGenerateRequest> listFromJson(List<dynamic> json) {
    return json.map((value) => BatchGenerateRequest.fromJson(value)).toList();
  }
}
