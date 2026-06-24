// ignore_for_file: non_constant_identifier_names
// ignore_for_file: deprecated_member_use_from_same_package
import '../../aspose_barcode_cloud.dart';

/// Optional PDF417 barcode generation parameters. Applies to Pdf417, MacroPdf417, MicroPdf417, and GS1MicroPdf417 barcode types.
class Pdf417Params {
  /// PDF417 barcode encode mode.
  //enum pdf417EncodeModeEnum {  Auto,  Binary,  ECI,  Extended,  };
  Pdf417EncodeMode? pdf417EncodeMode;

  /// PDF417 barcode error correction level.
  //enum pdf417ErrorLevelEnum {  Level0,  Level1,  Level2,  Level3,  Level4,  Level5,  Level6,  Level7,  Level8,  };
  Pdf417ErrorLevel? pdf417ErrorLevel;

  /// Whether to use truncated PDF417 format (removes right-side stop pattern).

  bool? pdf417Truncate;

  /// Number of columns in the PDF417 barcode. Values between 1 and 30. 0 for auto.

  int? pdf417Columns;

  /// Number of rows in the PDF417 barcode. Values between 3 and 90. 0 for automatic.

  int? pdf417Rows;

  /// PDF417 barcode aspect ratio (height/width of the barcode module). Values are defined by the standard: 2 to 5 for MicroPdf417; 3 to 5 for Pdf417 and MacroPdf417.

  double? pdf417AspectRatio;

  /// ECI encoding for PDF417 barcode data.
  //enum pdf417ECIEncodingEnum {  NONE,  ISO_8859_1,  ISO_8859_2,  ISO_8859_3,  ISO_8859_4,  ISO_8859_5,  ISO_8859_6,  ISO_8859_7,  ISO_8859_8,  ISO_8859_9,  ISO_8859_10,  ISO_8859_11,  ISO_8859_13,  ISO_8859_14,  ISO_8859_15,  ISO_8859_16,  Shift_JIS,  Win1250,  Win1251,  Win1252,  Win1256,  UTF16BE,  UTF8,  US_ASCII,  Big5,  GB2312,  EUC_KR,  GBK,  GB18030,  UTF16LE,  UTF32BE,  UTF32LE,  INVARIANT,  BINARY,  };
  ECIEncodings? pdf417ECIEncoding;

  /// Whether the barcode is used for reader initialization (programming).

  bool? pdf417IsReaderInitialization;

  /// Macro character to prepend (structured append).
  //enum pdf417MacroCharactersEnum {  None,  Macro05,  Macro06,  };
  MacroCharacter? pdf417MacroCharacters;

  /// Whether to use linked mode (for MicroPdf417).

  bool? pdf417IsLinked;

  /// Whether to use Code128 emulation for MicroPdf417.

  bool? pdf417IsCode128Emulation;

  /// Constructor
  Pdf417Params(
      [this.pdf417EncodeMode,
      this.pdf417ErrorLevel,
      this.pdf417Truncate,
      this.pdf417Columns,
      this.pdf417Rows,
      this.pdf417AspectRatio,
      this.pdf417ECIEncoding,
      this.pdf417IsReaderInitialization,
      this.pdf417MacroCharacters,
      this.pdf417IsLinked,
      this.pdf417IsCode128Emulation]);

  @override
  String toString() {
    return 'Pdf417Params[pdf417EncodeMode=$pdf417EncodeMode, pdf417ErrorLevel=$pdf417ErrorLevel, pdf417Truncate=$pdf417Truncate, pdf417Columns=$pdf417Columns, pdf417Rows=$pdf417Rows, pdf417AspectRatio=$pdf417AspectRatio, pdf417ECIEncoding=$pdf417ECIEncoding, pdf417IsReaderInitialization=$pdf417IsReaderInitialization, pdf417MacroCharacters=$pdf417MacroCharacters, pdf417IsLinked=$pdf417IsLinked, pdf417IsCode128Emulation=$pdf417IsCode128Emulation, ]';
  }

  /// Creates a Pdf417Params instance from a JSON representation.
  Pdf417Params.fromJson(Map<String, dynamic> json) {
    pdf417EncodeMode = json['pdf417EncodeMode'] == null
        ? null
        : Pdf417EncodeMode.fromJson(json['pdf417EncodeMode']);
    pdf417ErrorLevel = json['pdf417ErrorLevel'] == null
        ? null
        : Pdf417ErrorLevel.fromJson(json['pdf417ErrorLevel']);
    pdf417Truncate = json['pdf417Truncate'];
    pdf417Columns = json['pdf417Columns'];
    pdf417Rows = json['pdf417Rows'];
    pdf417AspectRatio = json['pdf417AspectRatio'];
    pdf417ECIEncoding = json['pdf417ECIEncoding'] == null
        ? null
        : ECIEncodings.fromJson(json['pdf417ECIEncoding']);
    pdf417IsReaderInitialization = json['pdf417IsReaderInitialization'];
    pdf417MacroCharacters = json['pdf417MacroCharacters'] == null
        ? null
        : MacroCharacter.fromJson(json['pdf417MacroCharacters']);
    pdf417IsLinked = json['pdf417IsLinked'];
    pdf417IsCode128Emulation = json['pdf417IsCode128Emulation'];
  }

  /// Returns a JSON representation of Pdf417Params.
  Map<String, dynamic> toJson() {
    return {
      'pdf417EncodeMode': pdf417EncodeMode,
      'pdf417ErrorLevel': pdf417ErrorLevel,
      'pdf417Truncate': pdf417Truncate,
      'pdf417Columns': pdf417Columns,
      'pdf417Rows': pdf417Rows,
      'pdf417AspectRatio': pdf417AspectRatio,
      'pdf417ECIEncoding': pdf417ECIEncoding,
      'pdf417IsReaderInitialization': pdf417IsReaderInitialization,
      'pdf417MacroCharacters': pdf417MacroCharacters,
      'pdf417IsLinked': pdf417IsLinked,
      'pdf417IsCode128Emulation': pdf417IsCode128Emulation
    };
  }

  /// Converts a list of JSON objects to a list of Pdf417Params instances.
  ///
  /// @param json The list of JSON objects to convert.
  /// @return A list of Pdf417Params instances.
  static List<Pdf417Params> listFromJson(List<dynamic> json) {
    return json.map((value) => Pdf417Params.fromJson(value)).toList();
  }
}
