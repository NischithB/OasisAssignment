import 'package:oasis_assignment/model/field.dart';

class DropDownModel extends FieldModel {
  late List<String> options;
  late String dropdownValue;
  DropDownModel(List<String> items, String label) : super(label: label) {
    options = items;
    dropdownValue = items[0];
  }

  Map getDesc() {
    var selections = {
      for (var item in options) item: item == dropdownValue ? true : false
    };
    return {
      'label': label,
      'selections': selections,
    };
  }

  @override
  String toString() {
    return """
DropDownField:
    label: $label
    dropdown value: $dropdownValue""";
  }
}
