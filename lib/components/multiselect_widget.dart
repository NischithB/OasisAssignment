import 'package:flutter/material.dart';
import 'package:oasis_assignment/model/multiselect_model.dart';

class CheckboxList extends StatefulWidget {
  const CheckboxList({Key? key, required this.model}) : super(key: key);

  final MultiSelectModel model;

  @override
  State<CheckboxList> createState() => _CheckboxListState();
}

class _CheckboxListState extends State<CheckboxList> {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Expanded(
                child: Text(
                  widget.model.label,
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),
                  softWrap: true,
                  maxLines: 100,
                ),
              ),
            ),
            Column(
              children: List.generate(
                  widget.model.options.length,
                  (index) => CheckboxListTile(
                      title: Text(widget.model.options[index]),
                      value: widget.model.checkValues[index],
                      onChanged: ((value) => setState(() {
                            widget.model.checkValues[index] = value ?? false;
                          })))),
            )
          ],
        ),
      ),
    );
  }
}
