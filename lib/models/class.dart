class Class {
  final String className;
  final String? classId;
  final String? classDescription;

  Class({
    required this.className,
    this.classId,
    this.classDescription,
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