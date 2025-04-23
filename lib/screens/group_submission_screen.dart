import 'package:flutter/material.dart';
import 'package:ourgesapp/models/deliverable.dart';
import 'package:ourgesapp/models/group.dart';
import 'package:ourgesapp/models/project.dart';
import 'package:ourgesapp/widgets/step_widget.dart';

class GroupSubmissionScreen extends StatefulWidget {
  const GroupSubmissionScreen({super.key, required this.project, required this.group});

  final Project project;
  final Group group;

  @override
  State<GroupSubmissionScreen> createState() => _GroupSubmissionScreenState();
}

class _GroupSubmissionScreenState extends State<GroupSubmissionScreen> {
  late PageController _pageController;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    // Initialisation du PageController
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();  // Libère la mémoire du controller quand le widget est détruit
    super.dispose();
  }

  List<List<Deliverable>> getSortedDeliverablesByStep() {
    final steps = widget.project.steps ?? [];
    final submissions = widget.group.submissions ?? [];
    List<List<Deliverable>> sorted = List.generate(steps.length, (_) => []);
    for (var submission in submissions) {
      int stepIndex = steps.indexWhere((step) => step.id == submission.stepId);
      if (stepIndex != -1) {
        sorted[stepIndex].add(submission);
      }
    }
    return sorted;
  }

  void _goToPrevious() {
    if (_currentPage > 0) {
      _pageController.previousPage(duration: Duration(milliseconds: 300), curve: Curves.easeInOut);
      setState(() => _currentPage--);
    }
  }

  void _goToNext() {
    if (_currentPage < (widget.project.steps!.length - 1)) {
      _pageController.nextPage(duration: Duration(milliseconds: 300), curve: Curves.easeInOut);
      setState(() => _currentPage++);
    }
  }

  @override
  Widget build(BuildContext context) {
    final steps = widget.project.steps ?? [];
    final sortedDeliverables = getSortedDeliverablesByStep();
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text("${widget.project.name} - ${widget.group.name}"),
      ),
      body: Column(
        children: [
          Align(
              alignment: Alignment.centerLeft,
              child: Padding(padding: const EdgeInsets.fromLTRB(16, 0, 0, 0),
                child: Text(
                  'Livrables',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              )
            ),
          SizedBox(
          height: screenHeight * 0.5, 
          child: PageView.builder(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() => _currentPage = index);
            },
            itemCount: steps.length,
            itemBuilder: (context, index) {
              final step = steps[index];
              final deliverables = sortedDeliverables[index];
              return StepWidget(
                title: step.name,
                description: step.description,
                status: step.status,
                dueDate: step.dueDate?.toString(),
                deliverables: deliverables,
              );
            },
          ),
        ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 125, // Set a fixed width for both buttons
                  child: ElevatedButton.icon(
                    onPressed: _currentPage > 0 ? _goToPrevious : null,
                    icon: Icon(Icons.arrow_back),
                    label: Text('Previous'),
                  ),
                ),
                Row(
                  children: List.generate(
                    steps.length,
                    (index) => Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4.0),
                      child: Icon(
                        Icons.circle,
                        size: 8,
                        color: _currentPage == index ? Colors.blue : Colors.grey,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 125, // Same fixed width as the previous button
                  child: ElevatedButton.icon(
                    onPressed: _currentPage < steps.length - 1 ? _goToNext : null,
                    icon: Icon(Icons.arrow_forward),
                    label: Text('Next'),
                  ),
                ),
              ],
            ),
          ),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Report submission for ${widget.group.name}',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

