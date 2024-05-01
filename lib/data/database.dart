import 'package:hive_flutter/hive_flutter.dart';

class TaskDatabase {
  List tasks = [];
  final _mybox = Hive.box("mybox");

  void createInitialData() {
    tasks = [
      ["Create a task", false]
    ];
  }

  void LoadData() {
    tasks = _mybox.get("TASKS");
  }

  void updateData() {
    _mybox.put("TASKS", tasks);
  }
}
