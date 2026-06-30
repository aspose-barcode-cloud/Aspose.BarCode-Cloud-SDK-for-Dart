// ignore_for_file: non_constant_identifier_names
// ignore_for_file: deprecated_member_use_from_same_package
import '../../aspose_barcode_cloud.dart';

/// Optional Code128 barcode generation parameters.
class Code128Params {
  /// Code128 barcode encode mode. Controls which Code 128 subset (A, B, C, or mix) is used.
  //enum code128EncodeModeEnum {  Auto,  CodeA,  CodeB,  CodeAB,  CodeC,  CodeAC,  CodeBC,  };
  Code128EncodeMode? code128EncodeMode;

  /// Constructor
  Code128Params([this.code128EncodeMode]);

  @override
  String toString() {
    return 'Code128Params[code128EncodeMode=$code128EncodeMode, ]';
  }

  /// Creates a Code128Params instance from a JSON representation.
  Code128Params.fromJson(Map<String, dynamic> json) {
    code128EncodeMode = json['code128EncodeMode'] == null
        ? null
        : Code128EncodeMode.fromJson(json['code128EncodeMode']);
  }

  /// Returns a JSON representation of Code128Params.
  Map<String, dynamic> toJson() {
    return {'code128EncodeMode': code128EncodeMode};
  }

  /// Converts a list of JSON objects to a list of Code128Params instances.
  ///
  /// @param json The list of JSON objects to convert.
  /// @return A list of Code128Params instances.
  static List<Code128Params> listFromJson(List<dynamic> json) {
    return json.map((value) => Code128Params.fromJson(value)).toList();
  }
}
