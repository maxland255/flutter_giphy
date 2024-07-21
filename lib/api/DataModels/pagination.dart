class PaginationData {
  final int offset;
  final int? totalCount;
  final int count;
  final int? nextCursor;

  PaginationData({
    required this.offset,
    required this.totalCount,
    required this.count,
    required this.nextCursor,
  });

  PaginationData.fromJson(Map<String, dynamic> json)
      : this(
          offset: json['offset'],
          totalCount: json['total_count'],
          count: json['count'],
          nextCursor: json["next_cursor"],
        );

  @override
  String toString() {
    return "PaginationData(offset: $offset, totalCount: $totalCount, count: $count, nextCursor: $nextCursor)";
  }
}
