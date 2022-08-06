import 'package:flutter/material.dart';
import 'package:oasis_assignment/model/field.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField({Key? key, required this.index, required this.field})
      : super(key: key);

  final int index;
  final FieldHelper field;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: TextFormField(
        validator: (value) {
          return (value == null || value.isEmpty) ? 'This is required' : null;
        },
        onSaved: (newValue) => field.add(newValue ?? ""),
        decoration: InputDecoration(labelText: 'Item $index'),
      ),
    );
  }
}
