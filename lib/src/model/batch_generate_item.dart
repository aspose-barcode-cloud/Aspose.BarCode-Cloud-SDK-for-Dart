// ignore_for_file: non_constant_identifier_names
// ignore_for_file: deprecated_member_use_from_same_package
import '../../aspose_barcode_cloud.dart';

/// One barcode to generate in a batch.
class BatchGenerateItem {
  /// Optional file name inside the archive. When omitted or blank, a sequential name is generated. Supplied safe names are preserved; the image format is independent of the file extension.

  String? fileName;

  /// Barcode generation parameters.

  late GenerateParams generation;

  /// Constructor
  BatchGenerateItem(this.generation, [this.fileName]);

  @override
  String toString() {
    return 'BatchGenerateItem[fileName=$fileName, generation=$generation, ]';
  }

  /// Creates a BatchGenerateItem instance from a JSON representation.
  BatchGenerateItem.fromJson(Map<String, dynamic> json) {
    fileName = json['fileName'];
    generation = GenerateParams.fromJson(json['generation']);
  }

  /// Returns a JSON representation of BatchGenerateItem.
  Map<String, dynamic> toJson() {
    return {'fileName': fileName, 'generation': generation};
  }

  /// Converts a list of JSON objects to a list of BatchGenerateItem instances.
  ///
  /// @param json The list of JSON objects to convert.
  /// @return A list of BatchGenerateItem instances.
  static List<BatchGenerateItem> listFromJson(List<dynamic> json) {
    return json.map((value) => BatchGenerateItem.fromJson(value)).toList();
  }
}
