/// QR barcode error correction level. Mirrors https://reference.aspose.com/barcode/net/aspose.barcode.generation/qrerrorlevel/
/// QRErrorLevel: [LevelL, LevelM, LevelQ, LevelH]
class QRErrorLevel {
  /// The underlying value of QRErrorLevel enum.
  late final String _value;

  QRErrorLevel._internal(this._value);

  /// QR barcode error correction level. Mirrors https://reference.aspose.com/barcode/net/aspose.barcode.generation/qrerrorlevel/
  // ignore: non_constant_identifier_names
  static final QRErrorLevel LevelL = QRErrorLevel._internal("LevelL");

  /// QR barcode error correction level. Mirrors https://reference.aspose.com/barcode/net/aspose.barcode.generation/qrerrorlevel/
  // ignore: non_constant_identifier_names
  static final QRErrorLevel LevelM = QRErrorLevel._internal("LevelM");

  /// QR barcode error correction level. Mirrors https://reference.aspose.com/barcode/net/aspose.barcode.generation/qrerrorlevel/
  // ignore: non_constant_identifier_names
  static final QRErrorLevel LevelQ = QRErrorLevel._internal("LevelQ");

  /// QR barcode error correction level. Mirrors https://reference.aspose.com/barcode/net/aspose.barcode.generation/qrerrorlevel/
  // ignore: non_constant_identifier_names
  static final QRErrorLevel LevelH = QRErrorLevel._internal("LevelH");

  /// Creates a QRErrorLevel instance from a JSON representation.
  QRErrorLevel.fromJson(dynamic data) {
    switch (data) {
      case 'LevelL':
      case 'LevelM':
      case 'LevelQ':
      case 'LevelH':
        _value = data;
        break;
      default:
        throw Exception('Unknown enum value to decode: $data');
    }
  }

  /// Returns a JSON representation of QRErrorLevel.
  String? toJson() {
    return _value;
  }

  @override
  String toString() {
    return _value.toString();
  }

  /// Converts a list of JSON objects to a list of QRErrorLevel instances.
  ///
  /// @param json The list of JSON objects to convert.
  /// @return A list of QRErrorLevel instances.
  static List<QRErrorLevel> listFromJson(List<dynamic> json) {
    return json.map((value) => QRErrorLevel.fromJson(value)).toList();
  }
}
