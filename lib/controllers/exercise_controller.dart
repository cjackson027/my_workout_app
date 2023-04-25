import 'package:my_workout_app/model/exercise.dart';
import 'package:my_workout_app/services/firestore_storage.dart';

class ExerciseController {
  factory ExerciseController() => _singleton;

  ExerciseController._internal();

  static final ExerciseController _singleton = ExerciseController._internal();

  Future<List<Exercise>> getExercises() {
    return FirestoreStorage().getExercises();
  }
  Future<Exercise> addExercise(String description, String title) {
    return FirestoreStorage().insertExercise(description, title);
  }

    Future<void> deleteExercise(Exercise exercise) {
    return FirestoreStorage().removeExercise(exercise);
  }
}