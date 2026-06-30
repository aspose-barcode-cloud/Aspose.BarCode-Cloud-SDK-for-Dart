/// MicroQR barcode version. Mirrors https://reference.aspose.com/barcode/net/aspose.barcode.generation/microqrversion/
/// MicroQRVersion: [Auto, M1, M2, M3, M4]
class MicroQRVersion {
  /// The underlying value of MicroQRVersion enum.
  late final String _value;

  MicroQRVersion._internal(this._value);

  /// MicroQR barcode version. Mirrors https://reference.aspose.com/barcode/net/aspose.barcode.generation/microqrversion/
  // ignore: non_constant_identifier_names
  static final MicroQRVersion Auto = MicroQRVersion._internal("Auto");

  /// MicroQR barcode version. Mirrors https://reference.aspose.com/barcode/net/aspose.barcode.generation/microqrversion/
  // ignore: non_constant_identifier_names
  static final MicroQRVersion M1 = MicroQRVersion._internal("M1");

  /// MicroQR barcode version. Mirrors https://reference.aspose.com/barcode/net/aspose.barcode.generation/microqrversion/
  // ignore: non_constant_identifier_names
  static final MicroQRVersion M2 = MicroQRVersion._internal("M2");

  /// MicroQR barcode version. Mirrors https://reference.aspose.com/barcode/net/aspose.barcode.generation/microqrversion/
  // ignore: non_constant_identifier_names
  static final MicroQRVersion M3 = MicroQRVersion._internal("M3");

  /// MicroQR barcode version. Mirrors https://reference.aspose.com/barcode/net/aspose.barcode.generation/microqrversion/
  // ignore: non_constant_identifier_names
  static final MicroQRVersion M4 = MicroQRVersion._internal("M4");

  /// Creates a MicroQRVersion instance from a JSON representation.
  MicroQRVersion.fromJson(dynamic data) {
    switch (data) {
      case 'Auto':
      case 'M1':
      case 'M2':
      case 'M3':
      case 'M4':
        _value = data;
        break;
      default:
        throw Exception('Unknown enum value to decode: $data');
    }
  }

  /// Returns a JSON representation of MicroQRVersion.
  String? toJson() {
    return _value;
  }

  @override
  String toString() {
    return _value.toString();
  }

  /// Converts a list of JSON objects to a list of MicroQRVersion instances.
  ///
  /// @param json The list of JSON objects to convert.
  /// @return A list of MicroQRVersion instances.
  static List<MicroQRVersion> listFromJson(List<dynamic> json) {
    return json.map((value) => MicroQRVersion.fromJson(value)).toList();
  }
}
