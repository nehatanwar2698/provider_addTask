import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_addtask/task_model.dart';

import '../todo_model.dart';

class EditTask extends StatefulWidget {
  String title;
  String desc;
  var index;
  EditTask({this.title = '', this.desc = '', this.index});

  @override
  State<EditTask> createState() => _EditTaskState();
}

class _EditTaskState extends State<EditTask> {
  final TextEditingController _titleController = TextEditingController();

  final TextEditingController _descController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _titleController.text = widget.title;
    _descController.text = widget.desc;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Task'),
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: TextFormField(
                controller: _titleController,
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Enter  title',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: TextFormField(
                controller: _descController,
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Enter  desciption',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  onPrimary: const Color.fromARGB(221, 255, 255, 255),
                  primary: Color.fromARGB(255, 223, 35, 35),
                  minimumSize: const Size(100, 42),
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                ),
                onPressed: () {
                  Provider.of<TodoModel>(context, listen: false).editTask(
                      TaskModel(_titleController.text, _descController.text),
                      widget.index);
                  Navigator.pop(context);
                  // isButtonDisabled ? null : startTimer();
                },
                child: const Text('Edit'),
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descController.dispose();
    super.dispose();
  }
}
