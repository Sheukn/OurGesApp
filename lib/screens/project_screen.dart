import 'package:flutter/material.dart';
import 'package:ourgesapp/models/deliverable.dart';
import 'package:ourgesapp/models/group.dart';
import 'package:ourgesapp/models/project.dart';
import 'package:ourgesapp/models/report.dart';
import 'package:ourgesapp/models/student.dart';
import 'package:ourgesapp/screens/group_screen.dart';
import 'package:ourgesapp/models/projectStep.dart';


class ProjectScreen extends StatefulWidget{
  const ProjectScreen({super.key, required this.classId});
  final String classId;

  static final project = Project(
  id: 'proj123',
  name: 'Projet de développement d\'application',
  description: 'Ce projet consiste à développer une application mobile pour les enseignants.',
  createdAt: '2025-04-22',
  groups: [
    Group(
      id: 'group123',
      name: 'Groupe 1',
      members: [
        Student(id: 'stu1', name: 'Alice', email: 'alicemail'),
        Student(id: 'stu2', name: 'Bob', email: 'bobemail'),
      ],
      deliverables: [
        Deliverable(
          id: 'del1',
          name: 'Rapport préliminaire',
          description: 'Version initiale du rapport',
          status: 'submitted',
          stepId: 'step1',
        ),
        Deliverable(
          id: 'del2',
          name: 'Présentation orale',
          description: 'Slides de la présentation',
          status: 'pending',
          stepId: "step2",
        ),
      ],
      report: Report(
        id: 'rep1',
        title: "Rapport préliminaire",
        description: "Version initiale du rapport",
        status: "submitted",
      ),
    ),
    Group(
      id: 'group124',
      name: 'Groupe 2',
      members: [
        Student(id: 'stu3', name: 'Charlie', email: 'charliemail'),
        Student(id: 'stu4', name: 'David', email: 'davidemail'),
      ],
      deliverables: [
        Deliverable(
          id: 'del3',
          name: 'Rapport préliminaire',
          description: 'Version initiale du rapport',
          status: 'pending',
          stepId: 'step1',
        ),
      ],
      report: Report(
        id: 'rep2',
        title: "Rapport préliminaire",
        description: "Version initiale du rapport",
        status: "pending",
      ),
    ),
  ],
  steps: [
    ProjectStep(
      id: 'step1',
      name: 'Phase de recherche',
      description: 'Recherche sur les besoins des utilisateurs',
      status: 'completed',
      dueDate: DateTime.parse('2025-05-01'),
    ),
    ProjectStep(
      id: 'step2',
      name: 'Phase de développement',
      description: 'Développement de l\'application mobile',
      status: 'in_progress',
      dueDate: DateTime.parse('2025-06-01'),
    ),
  ],
);

  static final List<Project> projects = [
    project,
    Project(
      id: 'proj124',
      name: 'Projet de développement web',
      description: 'Ce projet consiste à développer un site web pour les enseignants.',
      createdAt: '2025-04-22',
      groups: [],
    ),
  ];

  @override
  State<ProjectScreen> createState() => _ProjectScreenState();
}

class _ProjectScreenState extends State<ProjectScreen> {
  @override
  
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Liste des projets'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: ListView.builder(
          itemCount: ProjectScreen.projects.length,
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                title: Text(ProjectScreen.projects[index].name),
                subtitle: Text(ProjectScreen.projects[index].description),
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => GroupScreen(
                      project: ProjectScreen.projects[index],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}