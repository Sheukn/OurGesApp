import 'package:flutter/material.dart';
import 'package:ourgesapp/models/deliverable.dart';
import 'package:ourgesapp/models/project.dart';
import 'package:ourgesapp/models/report.dart';
import 'package:ourgesapp/screens/project_details_screen.dart';


class ProjectScreen extends StatefulWidget{
  const ProjectScreen({super.key, required this.classId});
  final String classId;

  static final List<Deliverable> deliverables = [
    Deliverable(
      id: '1',
      name: 'Deliverable 1',
      description: 'Description of Deliverable 1',
      status: "Received",
    ),
    Deliverable(
      id: '2',
      name: 'Deliverable 2',
      description: 'Description of Deliverable 2',
      status: "Pending",
    ),
    Deliverable(
      id: '3',
      name: 'Deliverable 3',
      description: 'Description of Deliverable 3',
      status: "In Progress",
    ),
  ];
  static final List<Project> projects = [
    Project(
      id: '1',
      name: 'Project 1',
      description: 'Description of Project 1',
      createdAt: '2023-01-01',
      deliverables: deliverables,
      report: Report(
        id: '1',
        title: 'Report Title',
        description: 'Report Description',
        status: 'Completed',
        updatedAt: '2023-01-15',
        url: 'https://example.com/report.pdf',
      ),
    ),
    Project(
      id: '2',
      name: 'Project 2',
      description: 'Description of Project 2',
      createdAt: '2023-02-01',
    ),
    Project(
      id: '3',
      name: 'Project 3',
      description: 'Description of Project 3',
      createdAt: '2023-03-01',
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
                    builder: (context) => ProjectDetailsScreen(
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