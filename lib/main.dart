import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'home_page.dart';
import 'model/form.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => CustomForm(), child: const OasisApp()));
}

class OasisApp extends StatelessWidget {
  const OasisApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: const HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
