import 'package:flutter/material.dart';
import 'home_page.dart';

class NewExercisePage extends StatefulWidget {
  const NewExercisePage({Key? key}) : super(key: key);

  @override
  State<NewExercisePage> createState() => _NewExercisePageState();
}

class _NewExercisePageState extends State<NewExercisePage> {
  final myController = TextEditingController();
  DateTime? _selectedDate;
  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the
    // widget tree.
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final today = DateTime.now();
    return Scaffold(
      appBar: AppBar(title: const Text('Add New Task')),
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: TextField(
              maxLines: 5,
              controller: myController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter new Task',
              ),
            ),
          ),

          ElevatedButton(
            onPressed: () => showDatePicker(
              context: context,
              initialDate: today.add(const Duration(days: 3)),
              firstDate: today,
              lastDate: today.add(const Duration(days: 1000)),
            ).then((DateTime? value) => setState(() => _selectedDate = value)),
            child: Text(_selectedDate?.toString() ?? 'Select Due Date'),
          ),

          FloatingActionButton(
            onPressed: () => Navigator.of(context).pop([myController.text,_selectedDate]),
            heroTag: "plus",
            tooltip: 'Save New Task',
            child: const Icon(Icons.save_alt_sharp),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }

}