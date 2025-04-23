import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ourgesapp/models/deliverable.dart';

class StepWidget extends StatelessWidget {
  final String title;
  final String description;
  final String status;
  final String? dueDate;
  final List<Deliverable>? deliverables;

  const StepWidget({
    super.key,
    required this.title,
    required this.description,
    required this.status,
    this.dueDate,
    this.deliverables,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(description),
            const SizedBox(height: 8),
            Text('Status: $status'),
            if (dueDate != null) ...[
              const SizedBox(height: 8),
              Text('Due Date: ${DateFormat('yyyy-MM-dd').format(DateTime.parse(dueDate!))}'),
            ] else ...[
              const SizedBox(height: 8),
              const Text('No due date provided'),
            ],
            if (deliverables != null && deliverables!.isNotEmpty) ...[
              const SizedBox(height: 8),
              const Text('Deliverables:'),
              for (var deliverable in deliverables!) ...[
                Text('- ${deliverable.name} (${deliverable.status})'),
              ],
            ] else ...[
              const SizedBox(height: 8),
              const Text('No deliverables available'),
            ],
          ],
        ),
      ),
    );
  }
}
