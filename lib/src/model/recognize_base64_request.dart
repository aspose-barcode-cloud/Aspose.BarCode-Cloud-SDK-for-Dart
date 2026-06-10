// ignore_for_file: non_constant_identifier_names
// ignore_for_file: deprecated_member_use_from_same_package
import '../../aspose_barcode_cloud.dart';

/// Barcode recognition request.
class RecognizeBase64Request {
  /// Array of barcode decode types to find.

  late List<DecodeBarcodeType> barcodeTypes;

  /// Barcode image bytes encoded as base-64.

  late String fileBase64;

  /// recognitionMode
  //enum recognitionModeEnum {  Fast,  Normal,  Excellent,  };
  RecognitionMode? recognitionMode;

  /// recognitionImageKind
  //enum recognitionImageKindEnum {  Photo,  ScannedDocument,  ClearImage,  };
  RecognitionImageKind? recognitionImageKind;

  /// Constructor
  RecognizeBase64Request(this.barcodeTypes, this.fileBase64,
      [this.recognitionMode, this.recognitionImageKind]);

  @override
  String toString() {
    return 'RecognizeBase64Request[barcodeTypes=$barcodeTypes, fileBase64=$fileBase64, recognitionMode=$recognitionMode, recognitionImageKind=$recognitionImageKind, ]';
  }

  /// Creates a RecognizeBase64Request instance from a JSON representation.
  RecognizeBase64Request.fromJson(Map<String, dynamic> json) {
    barcodeTypes = DecodeBarcodeType.listFromJson(json['barcodeTypes']);
    fileBase64 = json['fileBase64'];
    recognitionMode = json['recognitionMode'] == null
        ? null
        : RecognitionMode.fromJson(json['recognitionMode']);
    recognitionImageKind = json['recognitionImageKind'] == null
        ? null
        : RecognitionImageKind.fromJson(json['recognitionImageKind']);
  }

  /// Returns a JSON representation of RecognizeBase64Request.
  Map<String, dynamic> toJson() {
    return {
      'barcodeTypes': barcodeTypes,
      'fileBase64': fileBase64,
      'recognitionMode': recognitionMode,
      'recognitionImageKind': recognitionImageKind
    };
  }

  /// Converts a list of JSON objects to a list of RecognizeBase64Request instances.
  ///
  /// @param json The list of JSON objects to convert.
  /// @return A list of RecognizeBase64Request instances.
  static List<RecognizeBase64Request> listFromJson(List<dynamic> json) {
    return json.map((value) => RecognizeBase64Request.fromJson(value)).toList();
  }
}
