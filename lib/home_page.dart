import 'package:flutter/material.dart';
import 'package:oasis_assignment/components/multiselect_widget.dart';
import 'package:oasis_assignment/components/dropdown_widget.dart';
import 'package:provider/provider.dart';
import 'add_field_page.dart';
import 'model/form.dart';
import 'dart:developer' as developer;

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  void _navigateToAddFieldPage(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: ((context) => ChangeNotifierProvider(
                create: (context) => SelectedField(),
                child: const AddFieldPage()))));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(title: const Text('Oasis')),
        body: Column(
          children: [
            Expanded(
              child: Consumer<CustomForm>(
                builder: (context, form, child) {
                  return ListView(
                    children: form.fieldItems,
                  );
                },
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  OutlinedButton.icon(
                      onPressed: () => _navigateToAddFieldPage(context),
                      icon: const Icon(
                        Icons.add,
                        size: 22,
                      ),
                      label: const Text('Field'),
                      style: OutlinedButton.styleFrom(
                          side: const BorderSide(
                            color: Colors.transparent,
                          ),
                          backgroundColor: Colors.purple[50],
                          padding: const EdgeInsets.symmetric(
                              vertical: 14, horizontal: 22),
                          textStyle: const TextStyle(fontSize: 20),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24)))),
                  // const SizedBox(
                  //   width: 16,
                  // ),
                  ElevatedButton.icon(
                      onPressed: () {
                        Provider.of<CustomForm>(context, listen: false)
                            .fieldItems
                            .forEach((element) {
                          if (element is CustomDropDown) {
                            developer.log(element.model.toString(),
                                name: 'model_data');
                          } else if (element is CheckboxList) {
                            developer.log(element.model.toString(),
                                name: 'model_data');
                          }
                        });
                        const snackBar = SnackBar(content: Text('Form Saved'));
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      },
                      icon: const Icon(
                        Icons.done,
                        size: 22,
                      ),
                      label: const Text('Save'),
                      style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                              vertical: 14, horizontal: 22),
                          textStyle: const TextStyle(fontSize: 20),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24)))),
                ],
              ),
            )
          ],
        ));
  }
}
