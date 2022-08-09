import 'field.dart';

class MultiSelectModel extends FieldModel {
  late List<String> options;
  late List<bool> checkValues;

  MultiSelectModel(List<String> items, String label) : super(label: label) {
    options = items;
    checkValues = List.filled(items.length, false);
  }

  Map getDesc() {
    var selections = Map<String, bool>.fromIterables(options, checkValues);
    return {
      'label': label,
      'selections': selections,
    };
  }

  @override
  String toString() {
    Map<String, bool> str = {};
    for (int i = 0; i < options.length; i++) {
      str[options[i]] = checkValues[i];
    }
    return """
  MultiSelectField:
      label: $label
      ${str.toString()}""";
  }
}
