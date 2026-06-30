# aspose_barcode_cloud.model.QrParams

## Load the model package

```dart
import 'package:aspose_barcode_cloud/aspose_barcode_cloud.dart';
```
Optional QR barcode generation parameters. Applies to QR, GS1QR, MicroQR, and RectMicroQR barcode types.

## Properties

Name | Type | Description | Notes
---- | ---- | ----------- | -----
**qrEncodeMode** | [**QREncodeMode**](QREncodeMode.md) | QR barcode encode mode. | [optional] 
**qrErrorLevel** | [**QRErrorLevel**](QRErrorLevel.md) | QR barcode error correction level. | [optional] 
**qrVersion** | [**QRVersion**](QRVersion.md) | QR barcode version. Automatically selects the smallest version that fits the data. | [optional] 
**qrECIEncoding** | [**ECIEncodings**](ECIEncodings.md) | ECI encoding for QR barcode data. | [optional] 
**qrAspectRatio** | **double** | QR barcode aspect ratio. Values: 0 to 1. | [optional] 
**microQRVersion** | [**MicroQRVersion**](MicroQRVersion.md) | MicroQR barcode version. Used when BarcodeType is MicroQR. | [optional] 
**rectMicroQrVersion** | [**RectMicroQRVersion**](RectMicroQRVersion.md) | RectMicroQR barcode version. Used when BarcodeType is RectMicroQR. | [optional] 

