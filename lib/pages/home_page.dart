import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:my_workout_app/model/exercise.dart';

import 'package:provider/provider.dart';

import '../controllers/auth_controller.dart';
import '../controllers/exercise_controller.dart';
import '../view_models/profile_picture_notifier.dart';
import '../widgets/image_select_dialog.dart';
import 'new_exercise_page.dart';
import 'opening_page.dart';

// HW 4 expected 1 hour it took roughly 1 hour to a 1.5 hours

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final Future<List<Exercise>> _exercisesFuture = ExerciseController().getExercises();
  List<Exercise>? _exercises;

  Future<void> _delete() async {
    // final exercises = _exercises!.where((task) => task.isCompleted).toList();
    // final controller = ExerciseController();
    // for (final exercise in exercises) {
    //   await controller.deleteExercise(exercise);
    //   _exercises!.remove(exercise);
    // }
    // setState(() {});
  }

  Widget profilePic() {
    return ChangeNotifierProvider<ProfilePictureNotifier>(
      create: (_) => ProfilePictureNotifier(),
      builder: (context, _) {
        final profilePic = Provider.of<ProfilePictureNotifier>(context);
        return IconButton(
          onPressed: () async {
            final data = await showModalBottomSheet(
              context: context,
              builder: (_) => const ImageSelectDialog(),
            );
            if (data != null) {
              profilePic.updateProfilePicture(data as Uint8List);
            }
          },
          icon: CircleAvatar(
              backgroundImage:profilePic.exists ? MemoryImage(profilePic.data as Uint8List) : null
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Exercise>>(
        future: _exercisesFuture,
        builder: (context, snapshot) {
          if (_exercises == null && snapshot.hasData) {
            _exercises = snapshot.data;
          }
          if (_exercises == null) {
            return Scaffold(
              appBar: AppBar(title: const Text('Todo')),
              body: const CircularProgressIndicator(),
            );
          }

          return Scaffold(
            appBar: AppBar(title: const Text('Todo'),
                actions: [

                  // if (_exercises!.any((task) => task.isCompleted))
                  //   IconButton(
                  //     onPressed: () {
                  //       setState(() {
                  //         //_tasks!.removeWhere((task) => task.isCompleted == true);
                  //         _delete();
                  //       });
                  //     },
                  //     icon: const Icon(Icons.delete),
                  //
                  //   ),
                  profilePic(),
                ]
            ),


            body: ListView.separated(
              itemBuilder: (_, index) => _toWidget(index),
              separatorBuilder: (_, __) => const Divider(),
              itemCount: _exercises!.length,
            ),
            floatingActionButton: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                FloatingActionButton(
                  onPressed: () async {
                    final result = await Navigator.of(context).push(
                        MaterialPageRoute(builder: (_) => const NewExercisePage()));
                    if (result is List &&
                        result[0] is String &&
                        (result[1] is DateTime || result[1] == null) &&
                        result.isNotEmpty) {
                      //  Task addTask = Task(description: result);
                      // setState(() {
                      //     _tasks!.add(addTask);
                      // });
                      print(result.first + ";" + result.last.toString());
                      final exercise = await ExerciseController()
                          .addExercise(result.first, result.last);
                      setState(() => _exercises!.add(exercise));
                      // TODO create a new task based on the result
                      // TODO Use setState to add the the new task to the list of tasks
                    }
                  },
                  heroTag: "plus",
                  tooltip: 'New Task',
                  child: const Icon(Icons.add),
                ),
                const SizedBox(height: 10),
              ],
            ),
            drawer: Drawer(
              child: SafeArea(
                child: Column(
                  children: [
                    ListTile(
                      title: const Text('Sign out'),
                      onTap: () {
                        AuthController().signOut();
                        Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(
                                builder: (_) => const OpeningPage()),
                                (_) => false);
                      },
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }

  Widget _toWidget(int index) {
    //return const SizedBox();

    return CheckboxListTile(
      title: Text(_exercises![index].title),
      subtitle: Text(
        _exercises![index].description
      ),
      onChanged: (bool? value) {  }, value: null,
      // value: _exercises![index].isCompleted,
      // onChanged: (bool? newValue) {
      //   setState(() {
      //     _exercises![index].isCompleted = newValue!;
      //   });
      // },
      secondary: const Icon(Icons.add_home_work),
    );
  }

}