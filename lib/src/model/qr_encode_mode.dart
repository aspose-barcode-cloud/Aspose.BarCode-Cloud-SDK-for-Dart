/// QR barcode encode mode. Subset of https://reference.aspose.com/barcode/net/aspose.barcode.generation/qrencodemode/ Obsolete members (Bytes, Utf8BOM, Utf16BEBOM, ECIEncoding, ExtendedCodetext) are omitted.
/// QREncodeMode: [Auto, Extended, Binary, ECI]
class QREncodeMode {
  /// The underlying value of QREncodeMode enum.
  late final String _value;

  QREncodeMode._internal(this._value);

  /// QR barcode encode mode. Subset of https://reference.aspose.com/barcode/net/aspose.barcode.generation/qrencodemode/ Obsolete members (Bytes, Utf8BOM, Utf16BEBOM, ECIEncoding, ExtendedCodetext) are omitted.
  // ignore: non_constant_identifier_names
  static final QREncodeMode Auto = QREncodeMode._internal("Auto");

  /// QR barcode encode mode. Subset of https://reference.aspose.com/barcode/net/aspose.barcode.generation/qrencodemode/ Obsolete members (Bytes, Utf8BOM, Utf16BEBOM, ECIEncoding, ExtendedCodetext) are omitted.
  // ignore: non_constant_identifier_names
  static final QREncodeMode Extended = QREncodeMode._internal("Extended");

  /// QR barcode encode mode. Subset of https://reference.aspose.com/barcode/net/aspose.barcode.generation/qrencodemode/ Obsolete members (Bytes, Utf8BOM, Utf16BEBOM, ECIEncoding, ExtendedCodetext) are omitted.
  // ignore: non_constant_identifier_names
  static final QREncodeMode Binary = QREncodeMode._internal("Binary");

  /// QR barcode encode mode. Subset of https://reference.aspose.com/barcode/net/aspose.barcode.generation/qrencodemode/ Obsolete members (Bytes, Utf8BOM, Utf16BEBOM, ECIEncoding, ExtendedCodetext) are omitted.
  // ignore: non_constant_identifier_names
  static final QREncodeMode ECI = QREncodeMode._internal("ECI");

  /// Creates a QREncodeMode instance from a JSON representation.
  QREncodeMode.fromJson(dynamic data) {
    switch (data) {
      case 'Auto':
      case 'Extended':
      case 'Binary':
      case 'ECI':
        _value = data;
        break;
      default:
        throw Exception('Unknown enum value to decode: $data');
    }
  }

  /// Returns a JSON representation of QREncodeMode.
  String? toJson() {
    return _value;
  }

  @override
  String toString() {
    return _value.toString();
  }

  /// Converts a list of JSON objects to a list of QREncodeMode instances.
  ///
  /// @param json The list of JSON objects to convert.
  /// @return A list of QREncodeMode instances.
  static List<QREncodeMode> listFromJson(List<dynamic> json) {
    return json.map((value) => QREncodeMode.fromJson(value)).toList();
  }
}
