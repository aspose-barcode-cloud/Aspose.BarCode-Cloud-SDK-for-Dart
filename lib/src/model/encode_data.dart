// ignore_for_file: non_constant_identifier_names
// ignore_for_file: deprecated_member_use_from_same_package
import '../../aspose_barcode_cloud.dart';

/// Data to encode in a barcode.
class EncodeData {
  /// Type of data to encode. Default value: StringData.
  //enum dataTypeEnum {  StringData,  Base64Bytes,  HexBytes,  };
  EncodeDataType? dataType;

  /// String that represents the data to encode.

  late String data;

  /// Constructor
  EncodeData(this.data, [this.dataType]);

  @override
  String toString() {
    return 'EncodeData[dataType=$dataType, data=$data, ]';
  }

  /// Creates a EncodeData instance from a JSON representation.
  EncodeData.fromJson(Map<String, dynamic> json) {
    dataType = json['dataType'] == null
        ? null
        : EncodeDataType.fromJson(json['dataType']);
    data = json['data'];
  }

  /// Returns a JSON representation of EncodeData.
  Map<String, dynamic> toJson() {
    return {'dataType': dataType, 'data': data};
  }

  /// Converts a list of JSON objects to a list of EncodeData instances.
  ///
  /// @param json The list of JSON objects to convert.
  /// @return A list of EncodeData instances.
  static List<EncodeData> listFromJson(List<dynamic> json) {
    return json.map((value) => EncodeData.fromJson(value)).toList();
  }
}
