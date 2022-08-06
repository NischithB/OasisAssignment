import 'package:flutter/material.dart';
import 'package:oasis_assignment/model/dropdown_model.dart';

class CustomDropDown extends StatefulWidget {
  CustomDropDown({
    Key? key,
    required this.model,
  }) : super(key: key);
  DropDownModel model;

  @override
  State<CustomDropDown> createState() => _CustomDropDownState();
}

class _CustomDropDownState extends State<CustomDropDown> {
  late String dropdownValue;

  @override
  void initState() {
    super.initState();
    dropdownValue = widget.model.dropdownValue;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 27),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Expanded(
                    child: Text(
                  widget.model.label,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16),
                )),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                DropdownButton<String>(
                    value: widget.model.dropdownValue,
                    items: widget.model.options
                        .map((item) => DropdownMenuItem<String>(
                            value: item,
                            child: Expanded(
                              child: Text(
                                item,
                              ),
                            )))
                        .toList(),
                    onChanged: ((value) => setState(() {
                          widget.model.dropdownValue = value ?? "";
                        }))),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
