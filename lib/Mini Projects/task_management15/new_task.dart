import 'package:flutter/material.dart';
import 'task.dart';
import 'database.dart';
import 'package:intl/intl.dart';
import 'tasks_list.dart';

class NewTaskScreen extends StatefulWidget {
  const NewTaskScreen({Key? key}) : super(key: key);

  @override
  _NewTaskScreenState createState() => _NewTaskScreenState();
}

class _NewTaskScreenState extends State<NewTaskScreen> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController _controllerTitle = TextEditingController();
  final TextEditingController _controllerDesc = TextEditingController();
  final TextEditingController _controllerDate = TextEditingController();
  DateTime selectedDate = DateTime.now();
  String formattedDate = "";
  bool pressed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        title: const Text('New Tasks'),
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
                              initialDate: DateTime.now(),
                              firstDate: DateTime(2000),
                              lastDate: DateTime(2030),
                            );
                            if (newDate != null) {
                              selectedDate = newDate;
                              formattedDate =
                                  DateFormat('dd-MM-yyyy').format(newDate);
                            }
                            setState(() {
                              _controllerDate.text = formattedDate;
                            });
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
                // padding: const EdgeInsets.only(bottom: 35.0),
                child: ElevatedButton(
                  child: const Text("Add Task"),
                  onPressed: () {
                    pressed = true;
                    if (formKey.currentState!.validate()) {
                      ConnectDatabase().addNewTask(Task(
                          title: _controllerTitle.text,
                          description: _controllerDesc.text,
                          date: selectedDate));
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
