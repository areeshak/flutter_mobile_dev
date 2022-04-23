import 'package:flutter/material.dart';

class CounterProvider extends ChangeNotifier{

  int _count = 0;                                          //changed by this class
  int get count => _count;                                //return count value

  void increment(){
    _count++;                                             //increment count
    notifyListeners();                                    //same like setState i.e. notify that count updated!
  }
}
