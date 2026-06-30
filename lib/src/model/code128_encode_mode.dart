/// Code128 barcode encode mode. Mirrors https://reference.aspose.com/barcode/net/aspose.barcode.generation/code128encodemode/
/// Code128EncodeMode: [Auto, CodeA, CodeB, CodeAB, CodeC, CodeAC, CodeBC]
class Code128EncodeMode {
  /// The underlying value of Code128EncodeMode enum.
  late final String _value;

  Code128EncodeMode._internal(this._value);

  /// Code128 barcode encode mode. Mirrors https://reference.aspose.com/barcode/net/aspose.barcode.generation/code128encodemode/
  // ignore: non_constant_identifier_names
  static final Code128EncodeMode Auto = Code128EncodeMode._internal("Auto");

  /// Code128 barcode encode mode. Mirrors https://reference.aspose.com/barcode/net/aspose.barcode.generation/code128encodemode/
  // ignore: non_constant_identifier_names
  static final Code128EncodeMode CodeA = Code128EncodeMode._internal("CodeA");

  /// Code128 barcode encode mode. Mirrors https://reference.aspose.com/barcode/net/aspose.barcode.generation/code128encodemode/
  // ignore: non_constant_identifier_names
  static final Code128EncodeMode CodeB = Code128EncodeMode._internal("CodeB");

  /// Code128 barcode encode mode. Mirrors https://reference.aspose.com/barcode/net/aspose.barcode.generation/code128encodemode/
  // ignore: non_constant_identifier_names
  static final Code128EncodeMode CodeAB = Code128EncodeMode._internal("CodeAB");

  /// Code128 barcode encode mode. Mirrors https://reference.aspose.com/barcode/net/aspose.barcode.generation/code128encodemode/
  // ignore: non_constant_identifier_names
  static final Code128EncodeMode CodeC = Code128EncodeMode._internal("CodeC");

  /// Code128 barcode encode mode. Mirrors https://reference.aspose.com/barcode/net/aspose.barcode.generation/code128encodemode/
  // ignore: non_constant_identifier_names
  static final Code128EncodeMode CodeAC = Code128EncodeMode._internal("CodeAC");

  /// Code128 barcode encode mode. Mirrors https://reference.aspose.com/barcode/net/aspose.barcode.generation/code128encodemode/
  // ignore: non_constant_identifier_names
  static final Code128EncodeMode CodeBC = Code128EncodeMode._internal("CodeBC");

  /// Creates a Code128EncodeMode instance from a JSON representation.
  Code128EncodeMode.fromJson(dynamic data) {
    switch (data) {
      case 'Auto':
      case 'CodeA':
      case 'CodeB':
      case 'CodeAB':
      case 'CodeC':
      case 'CodeAC':
      case 'CodeBC':
        _value = data;
        break;
      default:
        throw Exception('Unknown enum value to decode: $data');
    }
  }

  /// Returns a JSON representation of Code128EncodeMode.
  String? toJson() {
    return _value;
  }

  @override
  String toString() {
    return _value.toString();
  }

  /// Converts a list of JSON objects to a list of Code128EncodeMode instances.
  ///
  /// @param json The list of JSON objects to convert.
  /// @return A list of Code128EncodeMode instances.
  static List<Code128EncodeMode> listFromJson(List<dynamic> json) {
    return json.map((value) => Code128EncodeMode.fromJson(value)).toList();
  }
}
