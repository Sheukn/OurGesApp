import 'package:ourgesapp/models/deliverable.dart';
import 'package:ourgesapp/models/report.dart';

class Project{

  String id;
  String name;
  String description;
  String createdAt;
  List<Deliverable>? deliverables;
  Report? report;

  Project({
    required this.id,
    required this.name,
    required this.description,
    required this.createdAt,
    this.deliverables,
    this.report,
  });

  factory Project.fromJson(Map<String, dynamic> json) {
    return Project(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      createdAt: json['created_at'],
      deliverables: (json['deliverables'] as List<dynamic>?)
          ?.map((e) => Deliverable.fromJson(e))
          .toList(),
      report: json['report'] != null ? Report.fromJson(json['report']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'created_at': createdAt,
      'deliverables': deliverables?.map((e) => e.toJson()).toList(),
      'report': report?.toJson(),
    };
  }

}