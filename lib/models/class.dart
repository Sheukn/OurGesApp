import 'package:ourgesapp/models/project.dart';
import 'package:ourgesapp/models/student.dart';

class Class {
  final String className;
  final String classId;
  final String? classDescription;
  final List<Project>? projects;
  final List<Student>? students;

  Class({
    required this.className,
    required this.classId,
    this.classDescription,
    this.projects,
    this.students,
  });

  factory Class.fromJson(Map<String, dynamic> json) {
    return Class(
      className: json['className'] as String,
      classId: json['classId'] as String,
      classDescription: json['classDescription'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'className': className,
      'classId': classId,
      'classDescription': classDescription,
    };
  }

  @override
  String toString() {
    return 'Class(className: $className, classId: $classId, classDescription: $classDescription)';
  }
}