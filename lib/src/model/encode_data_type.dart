/// Types of data that can be encoded into a barcode.
/// EncodeDataType: [StringData, Base64Bytes, HexBytes]
class EncodeDataType {
  /// The underlying value of EncodeDataType enum.
  late final String _value;

  EncodeDataType._internal(this._value);

  /// Types of data that can be encoded into a barcode.
  // ignore: non_constant_identifier_names
  static final EncodeDataType StringData =
      EncodeDataType._internal("StringData");

  /// Types of data that can be encoded into a barcode.
  // ignore: non_constant_identifier_names
  static final EncodeDataType Base64Bytes =
      EncodeDataType._internal("Base64Bytes");

  /// Types of data that can be encoded into a barcode.
  // ignore: non_constant_identifier_names
  static final EncodeDataType HexBytes = EncodeDataType._internal("HexBytes");

  /// Creates a EncodeDataType instance from a JSON representation.
  EncodeDataType.fromJson(dynamic data) {
    switch (data) {
      case 'StringData':
      case 'Base64Bytes':
      case 'HexBytes':
        _value = data;
        break;
      default:
        throw Exception('Unknown enum value to decode: $data');
    }
  }

  /// Returns a JSON representation of EncodeDataType.
  String? toJson() {
    return _value;
  }

  @override
  String toString() {
    return _value.toString();
  }

  /// Converts a list of JSON objects to a list of EncodeDataType instances.
  ///
  /// @param json The list of JSON objects to convert.
  /// @return A list of EncodeDataType instances.
  static List<EncodeDataType> listFromJson(List<dynamic> json) {
    return json.map((value) => EncodeDataType.fromJson(value)).toList();
  }
}
