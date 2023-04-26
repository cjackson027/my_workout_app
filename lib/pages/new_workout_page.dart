import 'package:flutter/material.dart';
import 'home_page.dart';

class NewWorkoutPage extends StatefulWidget {
  const NewWorkoutPage({Key? key}) : super(key: key);

  @override
  State<NewWorkoutPage> createState() => _NewWorkoutPageState();
}

class _NewWorkoutPageState extends State<NewWorkoutPage> {
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
      appBar: AppBar(title: const Text('Add New Workout')),
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: TextField(
              maxLines: 5,
              controller: myController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter new Workout Title',
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
            child: Text(_selectedDate?.toString() ?? 'Select Workout Date'),
          ),
          const SizedBox(height: 10),
          FloatingActionButton(
            onPressed: () => Navigator.of(context).pop([myController.text,_selectedDate]),
            heroTag: "plus",
            tooltip: 'Save New Workout',
            child: const Icon(Icons.save_alt_sharp),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }

}