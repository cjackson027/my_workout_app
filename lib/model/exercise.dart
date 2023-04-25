import 'package:uuid/uuid.dart';

class Exercise {
  Exercise({this.title = '',this.description = '', String? id})
      :  id = id ?? _uuid.v1();
  static const _uuid = Uuid();
  late final String description;
  final String id;
  final String title;
  toList() {}
}
