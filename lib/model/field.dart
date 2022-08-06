import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:oasis_assignment/add_field_page.dart';
import 'package:oasis_assignment/components/multiselect_widget.dart';
import 'package:oasis_assignment/components/dropdown_widget.dart';
import 'package:oasis_assignment/model/dropdown_model.dart';
import 'package:oasis_assignment/model/multiselect_model.dart';

abstract class FieldModel {
  String label;

  FieldModel({required this.label});
}

class FieldHelper {
  final List<String> _items = [];
  UnmodifiableListView<String> get items => UnmodifiableListView(_items);
  late String label;
  late Fields selectedField;

  void add(String item) {
    _items.add(item);
  }

  Widget _createDropdown() {
    final model = DropDownModel(items, label);
    return CustomDropDown(
      model: model,
    );
  }

  Widget _createCheckbox() {
    final model = MultiSelectModel(_items, label);
    return CheckboxList(
      model: model,
    );
  }

  Widget createField() {
    if (selectedField == Fields.dropdown) {
      return _createDropdown();
    } else {
      return _createCheckbox();
    }
  }
}
