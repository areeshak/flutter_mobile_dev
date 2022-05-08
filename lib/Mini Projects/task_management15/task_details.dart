import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'tasks_list.dart';
import 'task.dart';
import 'database.dart';

class TaskDetailsScreen extends StatefulWidget {
  final Task updateTask;

  const TaskDetailsScreen({Key? key, required this.updateTask})
      : super(key: key);

  @override
  _TaskDetailsScreenState createState() => _TaskDetailsScreenState();
}

class _TaskDetailsScreenState extends State<TaskDetailsScreen> {
  bool isRemoved = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(widget.updateTask.title),
        ),
        body: WillPopScope(
          onWillPop: () {
            Navigator.pop(context, true);
            return Future(() => false);
          },
          child: Center(
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.87,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    widget.updateTask.title,
                    style: const TextStyle(fontSize: 20),
                  ),
                  const Padding(padding: EdgeInsets.all(10)),
                  Text(
                    widget.updateTask.description,
                    style: const TextStyle(fontSize: 20),
                  ),
                  const Padding(padding: EdgeInsets.all(10)),
                  Row(
                    children: [
                      const Text(
                        'Due date: ',
                        style: TextStyle(fontSize: 20),
                      ),
                      Text(
                        DateFormat('dd-MM-yyyy').format(widget.updateTask.date),
                        style: const TextStyle(fontSize: 20),
                      )
                    ],
                  ),
                  const Padding(padding: EdgeInsets.all(10)),
                  widget.updateTask.date.isBefore(DateTime.now())
                      ? const Text(
                          'Due date has passed!',
                          style: TextStyle(fontSize: 20, color: Colors.red),
                        )
                      : Container(),
                  const Padding(padding: EdgeInsets.all(10)),
                  widget.updateTask.isDone == 1
                      ? Flexible(
                          child: Text(
                            'You marked this task as done on ${widget.updateTask.dateDone.toString()}',
                            style: const TextStyle(
                                fontSize: 20, color: Colors.green),
                          ),
                        )
                      : Padding(
                          padding: const EdgeInsets.only(top: 150),
                          child: SizedBox(
                            height: 50,
                            width: 200,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: Colors.green,
                              ),
                              onPressed: () {
                                if (widget.updateTask.isDone != 1) {
                                  ConnectDatabase()
                                      .markAsDone(widget.updateTask);
                                  setState(() {});
                                }
                              },
                              child: const Text('Mark as Done',
                                  style: TextStyle(fontSize: 20)),
                            ),
                          ),
                        ),
                  const Padding(padding: EdgeInsets.all(70)),
                  Container(
                    alignment: AlignmentDirectional.bottomCenter,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.red,
                      ),
                      onPressed: () async {
                        isRemoved = await showDialog(
                            //dialog
                            barrierDismissible: false,
                            context: context,
                            builder: (context) => AlertDialog(
                                  title: const Text('Remove this Task?'),
                                  content: const Text(
                                      'Do you want to remove this task?'),
                                  actions: [
                                    TextButton(
                                        onPressed: () {
                                          Navigator.of(context).pop(true);
                                        },
                                        child: const Text('Yes')),
                                    TextButton(
                                        onPressed: () {
                                          Navigator.of(context).pop(false);
                                        },
                                        child: const Text('No')),
                                  ],
                                ));

                        if (isRemoved == true) {
                          ConnectDatabase().deleteTask(widget.updateTask);
                          setState(() {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => const TasksList(),
                              ),
                            );
                          });
                        }
                      },
                      child: const Text('Delete Task',
                          style: TextStyle(fontSize: 20)),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
