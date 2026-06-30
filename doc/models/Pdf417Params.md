# aspose_barcode_cloud.model.Pdf417Params

## Load the model package

```dart
import 'package:aspose_barcode_cloud/aspose_barcode_cloud.dart';
```
Optional PDF417 barcode generation parameters. Applies to Pdf417, MacroPdf417, MicroPdf417, and GS1MicroPdf417 barcode types.

## Properties

Name | Type | Description | Notes
---- | ---- | ----------- | -----
**pdf417EncodeMode** | [**Pdf417EncodeMode**](Pdf417EncodeMode.md) | PDF417 barcode encode mode. | [optional] 
**pdf417ErrorLevel** | [**Pdf417ErrorLevel**](Pdf417ErrorLevel.md) | PDF417 barcode error correction level. | [optional] 
**pdf417Truncate** | **bool** | Whether to use truncated PDF417 format (removes right-side stop pattern). | [optional] 
**pdf417Columns** | **int** | Number of columns in the PDF417 barcode. Values between 1 and 30. 0 for auto. | [optional] 
**pdf417Rows** | **int** | Number of rows in the PDF417 barcode. Values between 3 and 90. 0 for automatic. | [optional] 
**pdf417AspectRatio** | **double** | PDF417 barcode aspect ratio (height/width of the barcode module). Values are defined by the standard: 2 to 5 for MicroPdf417; 3 to 5 for Pdf417 and MacroPdf417. | [optional] 
**pdf417ECIEncoding** | [**ECIEncodings**](ECIEncodings.md) | ECI encoding for PDF417 barcode data. | [optional] 
**pdf417IsReaderInitialization** | **bool** | Whether the barcode is used for reader initialization (programming). | [optional] 
**pdf417MacroCharacters** | [**MacroCharacter**](MacroCharacter.md) | Macro character to prepend (structured append). | [optional] 
**pdf417IsLinked** | **bool** | Whether to use linked mode (for MicroPdf417). | [optional] 
**pdf417IsCode128Emulation** | **bool** | Whether to use Code128 emulation for MicroPdf417. | [optional] 

