import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_addtask/screen/add_tsk.dart';
import 'package:provider_addtask/screen/edit_task.dart';
import 'package:provider_addtask/task_model.dart';
import 'package:provider_addtask/todo_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => TodoModel(),
      child: MaterialApp(
          title: 'Provider crud',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: const MyHomePage(title: 'Provider Todo ')),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController _textFieldController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    print("home");
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(child: Consumer<TodoModel>(
        builder: (context, todo, child) {
          return

              // Column(
              //   children: [
              //     Padding(
              //       padding:
              //           const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              //       child: ElevatedButton(
              //         style: ElevatedButton.styleFrom(
              //           onPrimary: const Color.fromARGB(221, 255, 255, 255),
              //           primary: Color.fromARGB(255, 223, 35, 35),
              //           minimumSize: const Size(100, 42),
              //           padding: const EdgeInsets.symmetric(horizontal: 16),
              //           shape: const RoundedRectangleBorder(
              //             borderRadius: BorderRadius.all(Radius.circular(10)),
              //           ),
              //         ),
              //         onPressed: () {
              //           Provider.of<TodoModel>(context, listen: false).pressMe();
              //         },
              //         child: const Text('pressed me'),
              //       ),
              //     ),
              //     Padding(
              //       padding:
              //           const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              //       child: ElevatedButton(
              //         style: ElevatedButton.styleFrom(
              //           onPrimary: const Color.fromARGB(221, 255, 255, 255),
              //           primary: Color.fromARGB(255, 223, 35, 35),
              //           minimumSize: const Size(100, 42),
              //           padding: const EdgeInsets.symmetric(horizontal: 16),
              //           shape: const RoundedRectangleBorder(
              //             borderRadius: BorderRadius.all(Radius.circular(10)),
              //           ),
              //         ),
              //         onPressed: () {
              //           // Provider.of<TodoModel>(context, listen: false)
              //           //     .addTaskInList(
              //           //   TaskModel(_titleController.text, _descController.text),
              //           // // );
              //           // Navigator.pop(context);
              //           // isButtonDisabled ? null : startTimer();
              //         },
              //         child: Text('${todo.text}'),
              //       ),
              //     )
              //   ],
              // );

              ListView.builder(
                  itemCount: todo.taskList.length,
                  itemBuilder: (context, index) {
                    return Stack(
                      children: [
                        ListTile(
                            contentPadding: const EdgeInsets.only(
                                left: 32, right: 32, top: 8, bottom: 8),
                            title: Row(
                              children: [
                                Text(
                                  '${index + 1} - ',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  todo.taskList[index].title,
                                  style: const TextStyle(
                                      color: Colors.black, fontSize: 20),
                                ),
                              ],
                            ),
                            subtitle: Text(
                                '      ${todo.taskList[index].detail}',
                                style: const TextStyle(
                                    color: Color.fromARGB(255, 79, 79, 80),
                                    fontSize: 16)),
                            trailing: IconButton(
                              icon: Icon(Icons.delete),
                              color: Colors.red,
                              onPressed: () {
                                todo.removeTask(index);
                              },
                            )),
                        Positioned(
                            right: 70,
                            top: 20,
                            child: IconButton(
                              icon: Icon(Icons.edit),
                              color: Colors.green,
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => EditTask(
                                            title: todo.taskList[index].title,
                                            desc: todo.taskList[index].detail,
                                            index: index,
                                          )),
                                );
                              },
                            ))
                      ],
                    );
                  });
        },
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddTask()),
          );
          // Provider.of<TodoModel>(context, listen: false).addTaskInList();
          // print(
          //     "tasklist${Provider.of<TodoModel>(context, listen: false).taskList}");
        },
        tooltip: 'add',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
