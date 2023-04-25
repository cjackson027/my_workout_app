import '../model/exercise.dart';


abstract class Storage {
  Future<List<Exercise>> getExercises();

  Future<Exercise> insertExercise(String description, String title);

  Future<void> removeExercise(Exercise exercise);
}
