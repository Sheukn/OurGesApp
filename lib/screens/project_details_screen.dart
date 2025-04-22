import 'package:flutter/material.dart';
import 'package:ourgesapp/models/project.dart';

class ProjectDetailsScreen extends StatelessWidget {
  const ProjectDetailsScreen({super.key, required this.project});
  
    final Project project;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(project.name + ' Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Description: ${project.description}'),
            const SizedBox(height: 16.0),
            Text('Created At: ${project.createdAt}'),
            const SizedBox(height: 16.0),
            if (project.deliverables != null && project.deliverables!.isNotEmpty)
              Text('Deliverables:'),
            ...?project.deliverables?.map((deliverable) => ListTile(
                  title: Text(deliverable.name),
                  subtitle: Text(deliverable.description ?? ''),
                )),
            if (project.report != null)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 16.0),
                  Text('Report:'),
                  ListTile(
                    title: Text(project.report!.title),
                    subtitle: Text(project.report!.description ?? ''),
                    trailing: IconButton(
                      icon: const Icon(Icons.download),
                      onPressed: () {
                        // Handle download action here
                      },
                    ),
                  ),
                  Text('Status: ${project.report!.status}'),
                  Text('Updated At: ${project.report!.updatedAt}'),
                  if (project.report!.url != null)
                    Text('URL: ${project.report!.url}'),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
