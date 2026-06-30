# aspose_barcode_cloud.model.BarcodeImageParams

## Load the model package

```dart
import 'package:aspose_barcode_cloud/aspose_barcode_cloud.dart';
```
Optional barcode image parameters.

## Properties

Name | Type | Description | Notes
---- | ---- | ----------- | -----
**imageFormat** | [**BarcodeImageFormat**](BarcodeImageFormat.md) | Barcode output image format. Default value: png. | [optional] [default to BarcodeImageFormat.png]
**textLocation** | [**CodeLocation**](CodeLocation.md) | Specify the displayed text location. Set to CodeLocation.None to hide CodeText. Default value depends on BarcodeType: CodeLocation.Below for 1D barcodes and CodeLocation.None for 2D barcodes. | [optional] 
**foregroundColor** | **String** | Specify the display color for bars and content. Value: Color name from https://reference.aspose.com/drawing/net/system.drawing/color/ or ARGB value starting with #. For example: AliceBlue or #FF000000. Default value: Black. | [optional] [default to &#39;Black&#39;]
**backgroundColor** | **String** | Background color of the barcode image. Value: Color name from https://reference.aspose.com/drawing/net/system.drawing/color/ or ARGB value starting with #. For example: AliceBlue or #FF000000. Default value: White. | [optional] [default to &#39;White&#39;]
**units** | [**GraphicsUnit**](GraphicsUnit.md) | Common units for all measurements. Default units: pixels. | [optional] 
**resolution** | **double** | Resolution of the barcode image. One value for both dimensions. Default value: 96 dpi. Decimal separator is a dot. | [optional] 
**imageHeight** | **double** | Height of the barcode image in the specified units. Default units: pixels. Decimal separator is a dot. | [optional] 
**imageWidth** | **double** | Width of the barcode image in the specified units. Default units: pixels. Decimal separator is a dot. | [optional] 
**rotationAngle** | **int** | Barcode image rotation angle, measured in degrees. For example, RotationAngle &#x3D; 0 or RotationAngle &#x3D; 360 means no rotation. If RotationAngle is not equal to 90, 180, 270, or 0, it may increase the difficulty for the scanner to read the image. Default value: 0. | [optional] 

