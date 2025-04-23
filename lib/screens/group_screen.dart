import 'package:flutter/material.dart';
import 'package:ourgesapp/models/project.dart';
import 'package:ourgesapp/screens/group_submission_screen.dart';

class GroupScreen extends StatelessWidget {
  const GroupScreen({super.key, required this.project});
  
    final Project project;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${project.name} Details"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: project.groups.length,
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                title: Text("Groupe ${index + 1}"),
                subtitle: Text('Members: ${project.groups[index].members.length}'),
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => GroupSubmissionScreen(
                      project: project,
                      group: project.groups[index],
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