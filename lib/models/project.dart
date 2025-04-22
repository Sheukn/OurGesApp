import 'package:ourgesapp/models/group.dart';
import 'package:ourgesapp/models/projectStep.dart';

class Project{

  String id;
  String name;
  String description;
  String createdAt;
  List<Group> groups;
  List<ProjectStep>? steps;

  Project({
    required this.id,
    required this.name,
    required this.description,
    required this.createdAt,
    required this.groups,
    this.steps,
    
  });

  factory Project.fromJson(Map<String, dynamic> json) {
    return Project(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      createdAt: json['created_at'],
      groups: (json['groups'] as List<dynamic>)
          .map((e) => Group.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'created_at': createdAt,
      'groups': groups.map((e) => e.toJson()).toList(),
    };
  }

}