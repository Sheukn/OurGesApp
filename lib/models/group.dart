import 'package:ourgesapp/models/deliverable.dart';
import 'package:ourgesapp/models/report.dart';
import 'package:ourgesapp/models/student.dart';

class Group {
  String id;
  String name;
  List<Student> members;
  List<Deliverable>? deliverables;
  Report? report;
  
  Group({
    required this.id,
    required this.name,
    required this.members,
    this.deliverables,
    this.report,
  });

  factory Group.fromJson(Map<String, dynamic> json) {
    return Group(
      id: json['id'] as String,
      name: json['name'] as String,
      members: (json['members'] as List<dynamic>)
          .map((e) => Student.fromJson(e as Map<String, dynamic>))
          .toList(),
      deliverables: (json['deliverables'] as List<dynamic>?)
          ?.map((e) => Deliverable.fromJson(e as Map<String, dynamic>))
          .toList(),
      report: json['report'] != null
          ? Report.fromJson(json['report'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'members': members.map((e) => e.toJson()).toList(),
    };
  }
}