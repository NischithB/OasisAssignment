import 'package:flutter/material.dart';
import 'package:oasis_assignment/components/field_settings.dart';
import 'package:oasis_assignment/model/field.dart';
import 'package:provider/provider.dart';

enum Fields { dropdown, checkbox }

class SelectedField extends ChangeNotifier {
  Fields _selectedField = Fields.dropdown;
  Fields get selectedField => _selectedField;

  void changeField(Fields field) {
    _selectedField = field;
    notifyListeners();
  }
}

class AddFieldPage extends StatefulWidget {
  const AddFieldPage({Key? key}) : super(key: key);

  @override
  State<AddFieldPage> createState() => _AddFieldPageState();
}

class _AddFieldPageState extends State<AddFieldPage> {
  static GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final field = FieldHelper();

  void _changeField(Fields? value) {
    Provider.of<SelectedField>(context, listen: false)
        .changeField(value ?? Fields.dropdown);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Add Field'),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.all(15),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(20)),
                child: Consumer<SelectedField>(
                  builder: (context, value, child) => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding:
                            EdgeInsets.only(top: 20.0, left: 20, bottom: 10),
                        child: Text('Select Field'),
                      ),
                      RadioListTile(
                          title: const Text('Dropdown'),
                          value: Fields.dropdown,
                          groupValue: value.selectedField,
                          onChanged: (Fields? value) => _changeField(value)),
                      RadioListTile(
                          title: const Text('Checkbox'),
                          value: Fields.checkbox,
                          groupValue: value.selectedField,
                          onChanged: (Fields? value) => _changeField(value))
                    ],
                  ),
                ),
              ),
              FieldSetting(
                formKey: formKey,
                field: field,
              ),
            ],
          ),
        ));
  }
}
