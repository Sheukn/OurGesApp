class Deliverable {

  String? id;
  String? name;
  String? description;
  String? status;
  DateTime? dueDate;
  String? assignedTo;

  Deliverable({
    this.id,
    this.name,
    this.description,
    this.status,
    this.dueDate,
    this.assignedTo,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'status': status,
      'dueDate': dueDate?.toIso8601String(),
      'assignedTo': assignedTo,
    };
  }

  factory Deliverable.fromJson(Map<String, dynamic> json) {
    return Deliverable(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      status: json['status'],
      dueDate: DateTime.parse(json['dueDate']),
      assignedTo: json['assignedTo'],
    );
  }
}