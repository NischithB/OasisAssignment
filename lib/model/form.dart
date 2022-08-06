import 'dart:collection';
import 'package:flutter/material.dart';

class CustomForm extends ChangeNotifier {
  final List<Widget> _fieldItems = [];
  UnmodifiableListView<Widget> get fieldItems =>
      UnmodifiableListView(_fieldItems);

  void add(Widget widget) {
    _fieldItems.add(widget);
    notifyListeners();
  }
}
