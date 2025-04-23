import 'package:ourgesapp/models/deliverable.dart';

class ProjectStep {

  String id;
  String name;
  String description;
  String status;
  DateTime? dueDate;
  List<Deliverable>? deliverables;


  ProjectStep({
    required this.id,
    required this.name,
    required this.description,
    required this.status,
    this.dueDate,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id.toString(),
      'name': name,
      'description': description,
      'status': status,
      'dueDate': dueDate?.toIso8601String(),
    };
  }

  factory ProjectStep.fromJson(Map<String, dynamic> json) {
    return ProjectStep(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      status: json['status'],
      dueDate: DateTime.parse(json['dueDate']),
    );
  }
}