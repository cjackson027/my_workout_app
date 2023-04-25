

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:my_workout_app/model/exercise.dart';
import 'package:my_workout_app/services/storage.dart';

import '../controllers/auth_controller.dart';

class FirestoreStorage implements Storage {
  static const _exercises = 'exercises';
  static const _description = 'description';
  static const _title = 'title';
  static const _users = 'users';

  @override
  Future<List<Exercise>> getExercises() async {
    // final db = FirebaseFirestore.instance;
    // final userId = AuthController().getUserId();
    // if (userId == null) {
    //   return [];
    // }
    // final event = await db.collection(_users).doc(userId).collection(_tasks).get();

    // for (var doc in event.docs) {
    //   print("${doc.id} => ${doc.data()[_description]}");
    //   print("${doc.id} => ${toDateTime(doc.data()[_dueDate])}");
    // }

    // return event.docs
    //     .map<Task>((e) => Task(
    //         id: e.id,
    //         description: e['description'] as String,
    //         dueDate: e['due_date'] == null
    //             ? null
    //             : toDateTime(e['due_date'])))
    //     .toList();
    //     .map<Task>((e) => Task( id: e['task_id'] as String, description: e['description'] as String, dueDate : e['due_date'] == null ? null : DateTime.fromMillisecondsSinceEpoch(e['due_date'] as int) ))
    //     .toList();

    return [];
  }

  @override
  Future<Exercise> insertExercise(String description, String? title) async {
    // final db = FirebaseFirestore.instance;
    // final userId = AuthController().getUserId();
    // // if (userId == null) {
    // //   return [];
    // // }

    // final task = <String, dynamic>{
    //   _description: description,
    //   _dueDate: dateTime,
    // };

    // // Add a new document with a generated ID
    // final event = await db.collection(_users).doc(userId).collection(_tasks).add(task);

    //     print('DocumentSnapshot added with ID: ${event.id}');

    // return Task(id: event.id,
    // description: description,
    // dueDate: dateTime);
    return Exercise();
  }

  @override
  Future<void> removeExercise(Exercise exercise) {
  //   final db = FirebaseFirestore.instance;
  //   final userId = AuthController().getUserId();
  //   // if (userId == null) {
  //   //   return [];
  //   // }

  //   db.collection(_users).doc(userId).collection(_tasks).doc(task.id).delete().then(
  //         (doc) => print("Document deleted"),
  //         onError: (e) => print("Error updating document $e"),
  //       );

     return Future.value();
  }
  
}