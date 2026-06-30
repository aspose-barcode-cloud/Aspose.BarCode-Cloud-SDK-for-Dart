/// PDF417 barcode encode mode. Mirrors https://reference.aspose.com/barcode/net/aspose.barcode.generation/pdf417encodemode/
/// Pdf417EncodeMode: [Auto, Binary, ECI, Extended]
class Pdf417EncodeMode {
  /// The underlying value of Pdf417EncodeMode enum.
  late final String _value;

  Pdf417EncodeMode._internal(this._value);

  /// PDF417 barcode encode mode. Mirrors https://reference.aspose.com/barcode/net/aspose.barcode.generation/pdf417encodemode/
  // ignore: non_constant_identifier_names
  static final Pdf417EncodeMode Auto = Pdf417EncodeMode._internal("Auto");

  /// PDF417 barcode encode mode. Mirrors https://reference.aspose.com/barcode/net/aspose.barcode.generation/pdf417encodemode/
  // ignore: non_constant_identifier_names
  static final Pdf417EncodeMode Binary = Pdf417EncodeMode._internal("Binary");

  /// PDF417 barcode encode mode. Mirrors https://reference.aspose.com/barcode/net/aspose.barcode.generation/pdf417encodemode/
  // ignore: non_constant_identifier_names
  static final Pdf417EncodeMode ECI = Pdf417EncodeMode._internal("ECI");

  /// PDF417 barcode encode mode. Mirrors https://reference.aspose.com/barcode/net/aspose.barcode.generation/pdf417encodemode/
  // ignore: non_constant_identifier_names
  static final Pdf417EncodeMode Extended =
      Pdf417EncodeMode._internal("Extended");

  /// Creates a Pdf417EncodeMode instance from a JSON representation.
  Pdf417EncodeMode.fromJson(dynamic data) {
    switch (data) {
      case 'Auto':
      case 'Binary':
      case 'ECI':
      case 'Extended':
        _value = data;
        break;
      default:
        throw Exception('Unknown enum value to decode: $data');
    }
  }

  /// Returns a JSON representation of Pdf417EncodeMode.
  String? toJson() {
    return _value;
  }

  @override
  String toString() {
    return _value.toString();
  }

  /// Converts a list of JSON objects to a list of Pdf417EncodeMode instances.
  ///
  /// @param json The list of JSON objects to convert.
  /// @return A list of Pdf417EncodeMode instances.
  static List<Pdf417EncodeMode> listFromJson(List<dynamic> json) {
    return json.map((value) => Pdf417EncodeMode.fromJson(value)).toList();
  }
}
