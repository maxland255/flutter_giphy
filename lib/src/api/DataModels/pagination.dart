/// Pagination data model
///
/// Contains the pagination data of the response
class PaginationData {
  /// The offset of the response
  final int offset;

  /// The total count available
  final int? totalCount;

  /// The count of the response
  final int count;

  /// The next cursor
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
