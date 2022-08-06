import 'package:flutter/material.dart';
import 'custom_textfield.dart';
import 'package:oasis_assignment/model/field.dart';
import 'package:provider/provider.dart';
import 'package:oasis_assignment/model/form.dart';
import 'package:oasis_assignment/add_field_page.dart';

class FieldSetting extends StatefulWidget {
  const FieldSetting({Key? key, required this.formKey, required this.field})
      : super(key: key);

  final GlobalKey<FormState> formKey;
  final FieldHelper field;

  @override
  State<FieldSetting> createState() => _FieldSettingState();
}

class _FieldSettingState extends State<FieldSetting> {
  late List<Widget> items;
  int counter = 0;
  final _formKey = GlobalKey<FormState>();
  final field = FieldHelper();

  @override
  void initState() {
    super.initState();
    items = [
      CustomTextField(
        index: 0,
        field: field,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: TextFormField(
              validator: (value) {
                return (value == null || value.isEmpty)
                    ? 'Label is required'
                    : null;
              },
              onSaved: (newLabel) => field.label = newLabel ?? "",
              decoration: const InputDecoration(
                  labelText: 'Enter Label', border: OutlineInputBorder()),
            ),
          ),
          Column(
            children: items,
          ),
          const SizedBox(
            height: 25,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton.icon(
                  onPressed: () {
                    setState(() {
                      counter++;
                      items.add(CustomTextField(index: counter, field: field));
                    });
                  },
                  icon: const Icon(Icons.add),
                  label: const Text('Add Item')),
              ElevatedButton.icon(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      field.selectedField =
                          Provider.of<SelectedField>(context, listen: false)
                              .selectedField;
                      Provider.of<CustomForm>(context, listen: false)
                          .add(field.createField());
                      Navigator.pop(context);
                    }
                  },
                  icon: const Icon(Icons.done),
                  label: const Text('Done')),
            ],
          )
        ],
      ),
    );
  }
}
