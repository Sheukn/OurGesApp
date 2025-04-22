import 'package:flutter/material.dart';
import 'package:ourgesapp/models/class.dart';
import 'package:ourgesapp/screens/project_screen.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static final List<Class> classes = [
    Class(
      className: 'Class 1',
      classId: '1',
      classDescription: 'Description of Class 1',
    ),
    Class(
      className: 'Class 2',
      classId: '2',
      classDescription: 'Description of Class 2',
    ),
    Class(
      className: 'Class 3',
      classId: '3',
      classDescription: 'Description of Class 3',
    ),
    Class(
      className: 'Class 4',
      classId: '4',
      classDescription: 'Description of Class 4',
    ),
    Class(
      className: 'Class 5',
      classId: '5',
      classDescription: 'Description of Class 5',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Liste des classes'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: ListView.builder(
          itemCount: classes.length,
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                title: Text(classes[index].className),
                subtitle: Text(classes[index].classDescription ?? ''),
                onTap: () => Navigator.push(context, 
                  MaterialPageRoute(
                    builder: (context) => ProjectScreen(classId: classes[index].classId),
                  ),
                ),
              ),
            );
          },
        ),
      )
    );
  }


}
