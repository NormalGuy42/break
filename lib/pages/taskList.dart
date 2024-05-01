import 'package:app/data/database.dart';
import 'package:flutter/material.dart';
import 'package:app/components/dialog.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:hive_flutter/hive_flutter.dart';

class taskList extends StatefulWidget {
  const taskList({super.key});

  @override
  State<taskList> createState() => _taskListState();
}

class _taskListState extends State<taskList> {
  //Database
  final _mybox = Hive.box('mybox');
  TaskDatabase db = TaskDatabase();
  @override
  void initState() {
    // TODO
    if (_mybox.get("TASKS") == null) {
      db.createInitialData();
    } else {
      db.LoadData();
    }
    super.initState();
  }

  final _controller = TextEditingController();
  //List of db

  //Checkbox tapped
  void checkBoxChanged(bool? value, int index) {
    setState(() {
      db.tasks[index][1] = !db.tasks[index][1];
    });
    db.updateData();
  }

  void saveTask() {
    setState(() {
      db.tasks.add([_controller.text, false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
    db.updateData();
  }

  //Create a task
  void createTask() {
    showDialog(
        context: context,
        builder: (context) {
          return DialogBox(
            controller: _controller,
            save: saveTask,
            cancel: () => Navigator.of(context).pop(),
          );
        });
  }

  //Delete task
  void deleteFunction(int index) {
    setState(() {
      db.tasks.removeAt(index);
    });
    db.updateData();
  }

  //Edit task
  void saveEdit(int index) {
    setState(() {
      db.tasks[index][0] = _controller.text;
      _controller.clear();
    });
    Navigator.of(context).pop();
    db.updateData();
  }

  void editFunction(int index) {
    setState(() {
      showDialog(
          context: context,
          builder: (context) {
            return DialogBox(
              controller: _controller,
              save: () => saveEdit(index),
              cancel: () => Navigator.of(context).pop(),
            );
          });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/');
            },
            icon: const Icon(
              color: Colors.red,
              Icons.arrow_back_ios_new,
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: createTask,
          backgroundColor: Colors.grey[200],
          elevation: 0,
          child: Icon(color: Colors.red[200], Icons.add, size: 30.0),
        ),
        body: ListView.builder(
          itemCount: db.tasks.length,
          itemBuilder: (context, index) {
            return Tasktile(
                taskName: db.tasks[index][0],
                taskCompleted: db.tasks[index][1],
                deleteTask: (context) => deleteFunction(index),
                editTask: (context) => editFunction(index),
                onChanged: (value) => checkBoxChanged(value, index));
          },
        ));
  }
}

class Tasktile extends StatelessWidget {
  final String taskName;
  final bool taskCompleted;
  Function(bool?)? onChanged;
  Function(BuildContext)? deleteTask;
  Function(BuildContext)? editTask;

  Tasktile(
      {super.key,
      required this.taskName,
      required this.taskCompleted,
      required this.onChanged,
      required this.deleteTask,
      required this.editTask});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0, right: 25.0, top: 25.0),
      child: Slidable(
        endActionPane: ActionPane(
          motion: const StretchMotion(),
          children: [
            SlidableAction(
              onPressed: editTask,
              icon: Icons.create_rounded,
              backgroundColor: Colors.black,
              borderRadius: BorderRadius.circular(12.0),
            ),
            SlidableAction(
              onPressed: deleteTask,
              icon: Icons.delete,
              backgroundColor: Colors.red,
              borderRadius: BorderRadius.circular(12.0),
            )
          ],
        ),
        child: Container(
          padding: const EdgeInsets.all(25.0),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(12.0)),
          child: Row(
            children: <Widget>[
              //Checkbox
              Checkbox(
                value: taskCompleted,
                onChanged: onChanged,
                activeColor: Colors.red[200],
              ),
              const SizedBox(width: 20.0),
              //Text
              Text(taskName,
                  style: TextStyle(
                      decoration: taskCompleted
                          ? TextDecoration.lineThrough
                          : TextDecoration.none)),
            ],
          ),
        ),
      ),
    );
  }
}
