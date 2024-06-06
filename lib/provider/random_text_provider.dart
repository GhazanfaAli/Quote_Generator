
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';


class RandomTextProvider with ChangeNotifier{

  String _text = '', _author = '';
  String get text => _text;
  String get author => _author;

  void generateText(String value1, String value2){
    _text = value1;
    _author = value2;
    notifyListeners();

  }
}