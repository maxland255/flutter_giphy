/// MetaData class
///
/// Contains the meta data of the response
class MetaData {
  /// Message
  final String msg;

  /// HTTP status code
  final int status;

  /// Response ID
  final String responseId;

  MetaData({
    required this.msg,
    required this.status,
    required this.responseId,
  });

  MetaData.fromJson(Map<String, dynamic> json)
      : this(
          msg: json['msg'],
          status: json['status'],
          responseId: json['response_id'],
        );
}
