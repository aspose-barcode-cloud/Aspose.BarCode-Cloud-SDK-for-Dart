// ignore_for_file: non_constant_identifier_names
// ignore_for_file: deprecated_member_use_from_same_package
import '../../aspose_barcode_cloud.dart';

/// Optional QR barcode generation parameters. Applies to QR, GS1QR, MicroQR, and RectMicroQR barcode types.
class QrParams {
  /// qrEncodeMode
  //enum qrEncodeModeEnum {  Auto,  Extended,  Binary,  ECI,  };
  QREncodeMode? qrEncodeMode;

  /// qrErrorLevel
  //enum qrErrorLevelEnum {  LevelL,  LevelM,  LevelQ,  LevelH,  };
  QRErrorLevel? qrErrorLevel;

  /// qrVersion
  //enum qrVersionEnum {  Auto,  Version01,  Version02,  Version03,  Version04,  Version05,  Version06,  Version07,  Version08,  Version09,  Version10,  Version11,  Version12,  Version13,  Version14,  Version15,  Version16,  Version17,  Version18,  Version19,  Version20,  Version21,  Version22,  Version23,  Version24,  Version25,  Version26,  Version27,  Version28,  Version29,  Version30,  Version31,  Version32,  Version33,  Version34,  Version35,  Version36,  Version37,  Version38,  Version39,  Version40,  };
  QRVersion? qrVersion;

  /// qrECIEncoding
  //enum qrECIEncodingEnum {  NONE,  ISO_8859_1,  ISO_8859_2,  ISO_8859_3,  ISO_8859_4,  ISO_8859_5,  ISO_8859_6,  ISO_8859_7,  ISO_8859_8,  ISO_8859_9,  ISO_8859_10,  ISO_8859_11,  ISO_8859_13,  ISO_8859_14,  ISO_8859_15,  ISO_8859_16,  Shift_JIS,  Win1250,  Win1251,  Win1252,  Win1256,  UTF16BE,  UTF8,  US_ASCII,  Big5,  GB2312,  EUC_KR,  GBK,  GB18030,  UTF16LE,  UTF32BE,  UTF32LE,  INVARIANT,  BINARY,  };
  ECIEncodings? qrECIEncoding;

  /// QR barcode aspect ratio. Values: 0 to 1.

  double? qrAspectRatio;

  /// microQRVersion
  //enum microQRVersionEnum {  Auto,  M1,  M2,  M3,  M4,  };
  MicroQRVersion? microQRVersion;

  /// rectMicroQrVersion
  //enum rectMicroQrVersionEnum {  Auto,  R7x43,  R7x59,  R7x77,  R7x99,  R7x139,  R9x43,  R9x59,  R9x77,  R9x99,  R9x139,  R11x27,  R11x43,  R11x59,  R11x77,  R11x99,  R11x139,  R13x27,  R13x43,  R13x59,  R13x77,  R13x99,  R13x139,  R15x43,  R15x59,  R15x77,  R15x99,  R15x139,  R17x43,  R17x59,  R17x77,  R17x99,  R17x139,  };
  RectMicroQRVersion? rectMicroQrVersion;

  /// Constructor
  QrParams(
      [this.qrEncodeMode,
      this.qrErrorLevel,
      this.qrVersion,
      this.qrECIEncoding,
      this.qrAspectRatio,
      this.microQRVersion,
      this.rectMicroQrVersion]);

  @override
  String toString() {
    return 'QrParams[qrEncodeMode=$qrEncodeMode, qrErrorLevel=$qrErrorLevel, qrVersion=$qrVersion, qrECIEncoding=$qrECIEncoding, qrAspectRatio=$qrAspectRatio, microQRVersion=$microQRVersion, rectMicroQrVersion=$rectMicroQrVersion, ]';
  }

  /// Creates a QrParams instance from a JSON representation.
  QrParams.fromJson(Map<String, dynamic> json) {
    qrEncodeMode = json['qrEncodeMode'] == null
        ? null
        : QREncodeMode.fromJson(json['qrEncodeMode']);
    qrErrorLevel = json['qrErrorLevel'] == null
        ? null
        : QRErrorLevel.fromJson(json['qrErrorLevel']);
    qrVersion = json['qrVersion'] == null
        ? null
        : QRVersion.fromJson(json['qrVersion']);
    qrECIEncoding = json['qrECIEncoding'] == null
        ? null
        : ECIEncodings.fromJson(json['qrECIEncoding']);
    qrAspectRatio = json['qrAspectRatio'];
    microQRVersion = json['microQRVersion'] == null
        ? null
        : MicroQRVersion.fromJson(json['microQRVersion']);
    rectMicroQrVersion = json['rectMicroQrVersion'] == null
        ? null
        : RectMicroQRVersion.fromJson(json['rectMicroQrVersion']);
  }

  /// Returns a JSON representation of QrParams.
  Map<String, dynamic> toJson() {
    return {
      'qrEncodeMode': qrEncodeMode,
      'qrErrorLevel': qrErrorLevel,
      'qrVersion': qrVersion,
      'qrECIEncoding': qrECIEncoding,
      'qrAspectRatio': qrAspectRatio,
      'microQRVersion': microQRVersion,
      'rectMicroQrVersion': rectMicroQrVersion
    };
  }

  /// Converts a list of JSON objects to a list of QrParams instances.
  ///
  /// @param json The list of JSON objects to convert.
  /// @return A list of QrParams instances.
  static List<QrParams> listFromJson(List<dynamic> json) {
    return json.map((value) => QrParams.fromJson(value)).toList();
  }
}
