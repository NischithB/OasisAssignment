import 'package:oasis_assignment/model/field.dart';

class DropDownModel extends FieldModel {
  late List<String> options;
  late String dropdownValue;
  DropDownModel(List<String> items, String label) : super(label: label) {
    options = items;
    dropdownValue = items[0];
  }

  @override
  String toString() {
    return """
DropDownField:
    label: $label
    dropdown value: $dropdownValue""";
  }
}
