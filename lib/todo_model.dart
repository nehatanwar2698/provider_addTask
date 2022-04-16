import 'package:flutter/cupertino.dart';
import 'package:provider_addtask/task_model.dart';
import 'package:english_words/english_words.dart';

class TodoModel extends ChangeNotifier {
  List<TaskModel> taskList = [];
  int count = 1;

  String text = "hi neha";

  addTaskInList(TaskModel taskModel) {
    // TaskModel taskModel = TaskModel(
    //     "title ${taskList.length}", "this is  task detail ${taskList.length}");
    count = taskList.length;
    taskList.add(taskModel);

    notifyListeners();
  }

  removeTask(index) {
    taskList.removeAt(index);
    notifyListeners();
  }

  editTask(TaskModel editTaskModel, index) {
    print("edit task");
    // TaskModel taskModel = TaskModel(
    //     "$title ${taskList.length}", "this is  task detail ${taskList.length}");
    taskList[index] = editTaskModel;
    notifyListeners();
  }

  pressMe() {
    final wordPair = WordPair.random();

    text = wordPair.asPascalCase;
    notifyListeners();
  }
}
