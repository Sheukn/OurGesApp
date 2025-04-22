class Report {
  String id;
  String title;
  String description;
  String status;
  String? updatedAt;
  String? url;

  Report({
    required this.id,
    required this.title,
    required this.description,
    required this.status,
    this.updatedAt,
    this.url,
  });

  factory Report.fromJson(Map<String, dynamic> json) {
    return Report(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      status: json['status'],
      updatedAt: json['updated_at'],
      url: json['url'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'description': description,
      'status': status,
      'updated_at': updatedAt,
      'url': url,
    };
  }
}