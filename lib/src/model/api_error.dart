// ignore_for_file: non_constant_identifier_names
// ignore_for_file: deprecated_member_use_from_same_package

/// Api Error.
class ApiError {
  /// Gets or sets api error code.

  late String code;

  /// Gets or sets error message.

  late String message;

  /// Gets or sets error description.

  String? description;

  /// Gets or sets server datetime.

  DateTime? dateTime;

  /// Gets or sets inner error.

  ApiError? innerError;

  /// Constructor
  ApiError(this.code, this.message,
      [this.description, this.dateTime, this.innerError]);

  @override
  String toString() {
    return 'ApiError[code=$code, message=$message, description=$description, dateTime=$dateTime, innerError=$innerError, ]';
  }

  /// Creates a ApiError instance from a JSON representation.
  ApiError.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    description = json['description'];
    dateTime =
        json['dateTime'] == null ? null : DateTime.parse(json['dateTime']);
    innerError = json['innerError'] == null
        ? null
        : ApiError.fromJson(json['innerError']);
  }

  /// Returns a JSON representation of ApiError.
  Map<String, dynamic> toJson() {
    return {
      'code': code,
      'message': message,
      'description': description,
      'dateTime': dateTime == null ? '' : dateTime!.toUtc().toIso8601String(),
      'innerError': innerError
    };
  }

  /// Converts a list of JSON objects to a list of ApiError instances.
  ///
  /// @param json The list of JSON objects to convert.
  /// @return A list of ApiError instances.
  static List<ApiError> listFromJson(List<dynamic> json) {
    return json.map((value) => ApiError.fromJson(value)).toList();
  }
}
