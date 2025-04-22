class Deliverable {

  String id;
  String name;
  String description;
  String status;
  String dueDate;
  String stepId;

  Deliverable({
    required this.id,
    required this.name,
    required this.description,
    required this.status,
    required this.dueDate,
    required this.stepId,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'status': status,
      'step_id': stepId,
    };
  }

  factory Deliverable.fromJson(Map<String, dynamic> json) {
    return Deliverable(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      status: json['status'],
      stepId: json['step_id'],
    );
  }
}