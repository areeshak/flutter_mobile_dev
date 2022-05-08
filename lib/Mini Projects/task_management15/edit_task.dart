import 'package:flutter/material.dart';
import 'database.dart';
import 'package:intl/intl.dart';
import 'tasks_list.dart';
import 'task.dart';

class EditTaskScreen extends StatefulWidget {
  final Task editTask;

  const EditTaskScreen({Key? key, required this.editTask}) : super(key: key);

  @override
  _EditTaskScreenState createState() => _EditTaskScreenState();
}

class _EditTaskScreenState extends State<EditTaskScreen> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController _controllerTitle =
      TextEditingController(text: "");
  final TextEditingController _controllerDesc = TextEditingController();
  final TextEditingController _controllerDate = TextEditingController();

  DateTime selectedDate = DateTime.now();
  String formattedDate = "";
  bool pressed = false;

  @override
  void initState() {
    _controllerTitle.text = widget.editTask.title;
    _controllerDesc.text = widget.editTask.description;
    _controllerDate.text =
        DateFormat('dd-MM-yyyy').format(widget.editTask.date).toString();
    selectedDate = widget.editTask.date;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Edit Tasks'),
      ),
      body: Center(
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                child: TextFormField(
                  controller: _controllerTitle,
                  decoration: const InputDecoration(
                    labelText: 'Title',
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (value) {
                    if (pressed) {
                      formKey.currentState!.validate();
                    }
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Empty Field';
                    }
                    return null;
                  },
                ),
              ),
              const Padding(padding: EdgeInsets.all(12)),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                child: TextFormField(
                  controller: _controllerDesc,
                  decoration: const InputDecoration(
                    labelText: 'Description',
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 65, horizontal: 20),
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (value) {
                    if (pressed) {
                      formKey.currentState!.validate();
                    }
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Empty Field';
                    }
                    return null;
                  },
                ),
              ),
              const Padding(padding: EdgeInsets.all(12)),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                child: TextFormField(
                  readOnly: true,
                  controller: _controllerDate,
                  decoration: InputDecoration(
                      label: const Text('Due date'),
                      labelStyle: const TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 22,
                      ),
                      border: const OutlineInputBorder(),
                      suffixIcon: IconButton(
                          onPressed: () async {
                            DateTime? newDate = await showDatePicker(
                              context: context,
                              initialDate: selectedDate,
                              firstDate: DateTime(2000),
                              lastDate: DateTime(2030),
                            );
                            if (newDate != null) {
                              selectedDate = newDate;
                              formattedDate =
                                  DateFormat('dd-MM-yyyy').format(newDate);
                              setState(() {
                                _controllerDate.text = formattedDate;
                              });
                            } else {
                              selectedDate = widget.editTask.date;
                            }
                            formKey.currentState!.validate();
                          },
                          icon: const Icon(Icons.arrow_forward_sharp))),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Select a date";
                    }
                    return null;
                  },
                ),
              ),
              const Padding(padding: EdgeInsets.all(60)),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.7,
                height: MediaQuery.of(context).size.width * 0.12,
                child: ElevatedButton(
                  child: const Text("Save"),
                  onPressed: () {
                    pressed = true;
                    if (formKey.currentState!.validate()) {
                      ConnectDatabase().updateTask(Task(
                          title: _controllerTitle.text,
                          description: _controllerDesc.text,
                          date: selectedDate,
                          isDone: widget.editTask.isDone,
                          dateDone: widget.editTask.dateDone,
                          docId: widget.editTask.docId));
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const TasksList(),
                        ),
                      );
                    }
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
