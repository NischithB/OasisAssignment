import 'package:flutter/material.dart';
import 'package:oasis_assignment/components/multiselect_widget.dart';
import 'package:oasis_assignment/components/dropdown_widget.dart';
import 'package:oasis_assignment/network/form_handler.dart';
import 'package:provider/provider.dart';
import 'add_field_page.dart';
import 'model/form.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
                      onPressed: () async {
                        const savingSnackBar =
                            SnackBar(content: Text('Saving Form....'));
                        ScaffoldMessenger.of(context)
                            .showSnackBar(savingSnackBar);
                        var ls = Provider.of<CustomForm>(context, listen: false)
                            .fieldItems;
                        var reqBody = {
                          'responses': List.generate(ls.length, (index) {
                            var item = ls[index];
                            if (item is CustomDropDown) {
                              return item.model.getDesc();
                            } else if (item is CheckboxList) {
                              return item.model.getDesc();
                            }
                          })
                        };
                        await FormHandler.saveForm(reqBody);
                        const savedSnackBar =
                            SnackBar(content: Text('Form Saved'));
                        if (!mounted) return;
                        ScaffoldMessenger.of(context)
                            .showSnackBar(savedSnackBar);
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
