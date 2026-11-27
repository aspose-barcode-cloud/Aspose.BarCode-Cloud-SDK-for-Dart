/// Archive format for batch barcode generation.
/// BatchArchiveFormat: [Zip, Tar, TarGzip]
class BatchArchiveFormat {
  /// The underlying value of BatchArchiveFormat enum.
  late final String _value;

  BatchArchiveFormat._internal(this._value);

  /// Archive format for batch barcode generation.
  // ignore: non_constant_identifier_names
  static final BatchArchiveFormat Zip = BatchArchiveFormat._internal("Zip");

  /// Archive format for batch barcode generation.
  // ignore: non_constant_identifier_names
  static final BatchArchiveFormat Tar = BatchArchiveFormat._internal("Tar");

  /// Archive format for batch barcode generation.
  // ignore: non_constant_identifier_names
  static final BatchArchiveFormat TarGzip =
      BatchArchiveFormat._internal("TarGzip");

  /// Creates a BatchArchiveFormat instance from a JSON representation.
  BatchArchiveFormat.fromJson(dynamic data) {
    switch (data) {
      case 'Zip':
      case 'Tar':
      case 'TarGzip':
        _value = data;
        break;
      default:
        throw Exception('Unknown enum value to decode: $data');
    }
  }

  /// Returns a JSON representation of BatchArchiveFormat.
  String? toJson() {
    return _value;
  }

  @override
  String toString() {
    return _value.toString();
  }

  /// Converts a list of JSON objects to a list of BatchArchiveFormat instances.
  ///
  /// @param json The list of JSON objects to convert.
  /// @return A list of BatchArchiveFormat instances.
  static List<BatchArchiveFormat> listFromJson(List<dynamic> json) {
    return json.map((value) => BatchArchiveFormat.fromJson(value)).toList();
  }
}
