import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:projecttime/models/activeProject.dart';
import 'package:projecttime/singletons/databaseHelper.dart';

class TaskList extends StatefulWidget {
  @override
  TaskListState createState() => TaskListState();
}

class TaskListState extends State<TaskList> {
  final dbHelper = DatabaseHelper();
  final _tasks = List<ActiveProject>();
  final _tasksDisplay = <ActiveProject>[];

  Widget build(BuildContext context) {
    return FutureBuilder(
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          _tasks.addAll(snapshot.data);
          return ListView.builder(
            padding: const EdgeInsets.all(16.0),
            itemCount: snapshot.data.length > 0 ? 0 : (snapshot.data.length*2)-1,
            itemBuilder: (context, i) {
              if (i.isOdd) {
                return Divider();
              }
              final index = i ~/ 2;
              if (index >= _tasksDisplay.length) {
                _tasksDisplay.addAll(_tasks.take(10));
              }
              return _buildRow(_tasks[index]);
            },
          );
        }
        else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
      future: dbHelper.getTasks(),
    );
  }

  Widget _buildRow(ActiveProject activeTask) {
    final formatterDateTime = new DateFormat('dd.MM.yyyy HH:mm:ss');

    return ListTile(
      title: Text(
        activeTask.projectName,
        style: TextStyle(fontSize: 25),
        ),
      subtitle: Text(formatterDateTime.format(activeTask.startTime.toLocal())+'\n'+formatterDateTime.format(activeTask.stopTime.toLocal())),
      trailing: Text(
        activeTask.time.inHours.toString().padLeft(2,'0')
        +':'+activeTask.time.inMinutes.remainder(60).toString().padLeft(2,'0')
        +':'+activeTask.time.inSeconds.remainder(60).toString().padLeft(2,'0'),
        style: TextStyle(fontSize: 20),
      ),
      isThreeLine: true,
    );
  }
}