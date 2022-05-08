import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'task.dart';


class ConnectDatabase
{
  void addNewTask(Task temp)
  {
    addTask(temp);
  }

  void markAsDone(Task task)
  {
    task.isDone = 1;
    task.dateDone = DateFormat('dd-MM-yyyy').format(DateTime.now());
    updateTask(task);
  }


  Future<void> addTask(Task task) async {
    CollectionReference tasks = FirebaseFirestore.instance.collection('tasks');
    tasks                                                                                           //collection name
        .add(task.toJson())                                                                         //add function takes a map as parameter
        .then((value) => Fluttertoast.showToast(
        msg: "Task Added",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.SNACKBAR,
        backgroundColor: Colors.blueGrey,
        textColor: Colors.black,
        fontSize: 16.0
    ),)
        .catchError((error) => Fluttertoast.showToast(
        msg: "Failed to add task",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.SNACKBAR,
        backgroundColor: Colors.blueGrey,
        textColor: Colors.black,
        fontSize: 16.0
    ));
  }

  Future<void> updateTask(Task task) async {
    CollectionReference tasks = FirebaseFirestore.instance.collection('tasks');
    tasks
        .doc(task.docId)
        .update({
      'title' : task.title,
      'description' : task.description,
      'date' : task.date,
      'isDone' : task.isDone,
      'dateDone' : task.dateDone,
    })                                                                         //add function takes a map as parameter
        .then((value) => Fluttertoast.showToast(
        msg: "Task Updated",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.SNACKBAR,
        backgroundColor: Colors.blueGrey,
        textColor: Colors.black,
        fontSize: 16.0
    ),)
        .catchError((error) => Fluttertoast.showToast(
        msg: "Failed to update task",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.SNACKBAR,
        backgroundColor: Colors.blueGrey,
        textColor: Colors.black,
        fontSize: 16.0
    ));
  }

  Future<void> deleteTask(Task task) async {
    CollectionReference tasks = FirebaseFirestore.instance.collection('tasks');
    tasks                                                                                           //collection name
        .doc(task.docId)
        .delete()
        .then((value) => Fluttertoast.showToast(
        msg: "Task Deleted",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.SNACKBAR,
        backgroundColor: Colors.blueGrey,
        textColor: Colors.black,
        fontSize: 16.0
    ),)
        .catchError((error) => Fluttertoast.showToast(
        msg: "Failed to remove task",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.SNACKBAR,
        backgroundColor: Colors.blueGrey,
        textColor: Colors.black,
        fontSize: 16.0
    ));
  }
}