import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:progress_indicators/progress_indicators.dart';
import 'package:intl/intl.dart';
import 'database.dart';
import 'new_task.dart';
import 'edit_task.dart';
import 'task_details.dart';
import 'task.dart';

class TasksList extends StatefulWidget {
  const TasksList({Key? key}) : super(key: key);

  @override
  _TasksListState createState() => _TasksListState();
}

class _TasksListState extends State<TasksList> {
  final List<Task> _newTasks = [];
  bool isLoading = false;
  bool isRemoved = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getTasks();
    //isLoading = true;
    sort();
  }

  @override
  Widget build(BuildContext context) {
    Color getColor(bool yes) {
      if (yes) {
        return Colors.red;
      }
      return Colors.white;
    }

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Tasks'),
        automaticallyImplyLeading: false,
      ),
      body: isLoading == false
          ? Center(
              child: JumpingDotsProgressIndicator(
                fontSize: 60.0,
              ),
            )
          : Center(
              child: _newTasks.isEmpty
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'You have no pending tasks',
                          style:
                              TextStyle(color: Colors.blueGrey, fontSize: 25),
                        ),
                        const Padding(padding: EdgeInsets.all(12)),
                        ElevatedButton(
                            child: const Text('Add Task'),
                            style: ElevatedButton.styleFrom(
                              minimumSize: const Size(230, 45),
                            ),
                            onPressed: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => const NewTaskScreen(),
                                ),
                              );
                            })
                      ],
                    )
                  //const Text('No Tasks')
                  : ListView.builder(
                      padding: const EdgeInsets.all(22),
                      itemCount: _newTasks.length,
                      itemBuilder: (context, index) {
                        return Dismissible(
                          key: UniqueKey(),
                          direction: DismissDirection.endToStart,
                          onDismissed: (direction) async {
                            isRemoved = await showDialog(
                                //dialog
                                barrierDismissible: false,
                                context: context,
                                builder: (context) => AlertDialog(
                                      title: const Text('Remove this task?'),
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
                              ConnectDatabase().deleteTask(_newTasks[index]);
                              _newTasks.removeAt(index);
                            }
                            setState(() {});
                          },
                          background: Container(color: Colors.red),
                          child: Card(
                            margin: const EdgeInsets.all(2),
                            shape: Border.all(color: Colors.black),
                            child: InkWell(
                              onTap: () async {
                                bool result = await Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => TaskDetailsScreen(
                                      updateTask: _newTasks[index],
                                    ),
                                  ),
                                );
                                if (result == true) {
                                  setState(() {
                                    sort();
                                  });
                                }
                              },
                              child: ListTile(
                                title: Text(_newTasks[index].title),
                                subtitle: Row(
                                  children: [
                                    const Text("Due Date: "),
                                    Text(DateFormat('dd-MM-yyyy')
                                        .format(_newTasks[index].date)),
                                  ],
                                ),
                                trailing: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    IconButton(
                                      icon: const Icon(Icons.edit),
                                      onPressed: () {
                                        Navigator.of(context).push(
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                EditTaskScreen(
                                              editTask: _newTasks[index],
                                            ),
                                          ),
                                        );
                                        setState(() {
                                          sort();
                                        });
                                      },
                                    ),
                                    IconButton(
                                      icon: _newTasks[index].isDone == 1
                                          ? const Icon(
                                              Icons.check_circle,
                                              color: Colors.green,
                                            )
                                          : const Icon(Icons.circle_outlined),
                                      onPressed: () {
                                        if (_newTasks[index].isDone != 1) {
                                          //_newTasks[index].isDone = 1;
                                          ConnectDatabase()
                                              .markAsDone(_newTasks[index]);
                                        }
                                        setState(() {
                                          sort();
                                        });
                                      },
                                    ),
                                    Container(
                                      width: 10,
                                      color: getColor(_newTasks[index]
                                          .date
                                          .isBefore(DateTime.now())),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      }),
            ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const NewTaskScreen(),
            ),
          );
        },
      ),
    );
  }

  void getTasks() {
    CollectionReference _ref = FirebaseFirestore.instance.collection('tasks');
    setState(() {});
    _ref.get().then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        _newTasks.add(Task.fromJson(doc.data() as Map<String, dynamic>));
        _newTasks[_newTasks.length - 1].docId = doc.reference.id;
        //print(doc.reference.id);
      });

      setState(() {
        isLoading = true;
        sort();
      });
    });
  }

  sort() {
    _newTasks.sort((a, b) => a.date.compareTo(b.date));
    _newTasks.sort((a, b) => a.isDone.compareTo(b.isDone));
  }
}
