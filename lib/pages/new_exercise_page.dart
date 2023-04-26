import 'package:flutter/material.dart';
import 'home_page.dart';

class NewExercisePage extends StatefulWidget {
  const NewExercisePage({Key? key}) : super(key: key);

  @override
  State<NewExercisePage> createState() => _NewExercisePageState();
}

class _NewExercisePageState extends State<NewExercisePage> {
  final myController1 = TextEditingController();
  final myController2 = TextEditingController();
  DateTime? _selectedDate;
  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the
    // widget tree.
    myController1.dispose();
    myController2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final today = DateTime.now();
    return Scaffold(
      appBar: AppBar(title: const Text('Add New Exercise')),
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: TextField(
              maxLines: 2,
              controller: myController1,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter new Exercise Title',
              ),
            ),


          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: TextField(
              maxLines: 2,
              controller: myController2,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter new Exercise Description',
              ),
            ),
            ),
          // ElevatedButton(
          //   onPressed: () => showDatePicker(
          //     context: context,
          //     initialDate: today.add(const Duration(days: 3)),
          //     firstDate: today,
          //     lastDate: today.add(const Duration(days: 1000)),
          //   ).then((DateTime? value) => setState(() => _selectedDate = value)),
          //   child: Text(_selectedDate?.toString() ?? 'Select Due Date'),
          // ),
          const SizedBox(height: 10),
          FloatingActionButton(
            onPressed: () => Navigator.of(context).pop([myController1.text,myController2.text]),
            heroTag: "plus",
            tooltip: 'Save New Exercise',
            child: const Icon(Icons.data_saver_on_sharp),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }

}