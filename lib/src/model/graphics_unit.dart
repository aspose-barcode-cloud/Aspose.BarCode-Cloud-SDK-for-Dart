/// Subset of https://reference.aspose.com/drawing/net/system.drawing/graphicsunit/
/// GraphicsUnit: [Pixel, Point, Inch, Millimeter]
class GraphicsUnit {
  /// The underlying value of GraphicsUnit enum.
  late final String _value;

  GraphicsUnit._internal(this._value);

  /// Subset of https://reference.aspose.com/drawing/net/system.drawing/graphicsunit/
  // ignore: non_constant_identifier_names
  static final GraphicsUnit Pixel = GraphicsUnit._internal("Pixel");

  /// Subset of https://reference.aspose.com/drawing/net/system.drawing/graphicsunit/
  // ignore: non_constant_identifier_names
  static final GraphicsUnit Point = GraphicsUnit._internal("Point");

  /// Subset of https://reference.aspose.com/drawing/net/system.drawing/graphicsunit/
  // ignore: non_constant_identifier_names
  static final GraphicsUnit Inch = GraphicsUnit._internal("Inch");

  /// Subset of https://reference.aspose.com/drawing/net/system.drawing/graphicsunit/
  // ignore: non_constant_identifier_names
  static final GraphicsUnit Millimeter = GraphicsUnit._internal("Millimeter");

  /// Creates a GraphicsUnit instance from a JSON representation.
  GraphicsUnit.fromJson(dynamic data) {
    switch (data) {
      case 'Pixel':
      case 'Point':
      case 'Inch':
      case 'Millimeter':
        _value = data;
        break;
      default:
        throw Exception('Unknown enum value to decode: $data');
    }
  }

  /// Returns a JSON representation of GraphicsUnit.
  String? toJson() {
    return _value;
  }

  @override
  String toString() {
    return _value.toString();
  }

  /// Converts a list of JSON objects to a list of GraphicsUnit instances.
  ///
  /// @param json The list of JSON objects to convert.
  /// @return A list of GraphicsUnit instances.
  static List<GraphicsUnit> listFromJson(List<dynamic> json) {
    return json.map((value) => GraphicsUnit.fromJson(value)).toList();
  }
}
