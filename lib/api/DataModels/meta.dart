class MetaData {
  final String msg;
  final int status;
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
