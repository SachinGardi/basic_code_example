import 'package:flutter/material.dart';

import 'drag_and_drop_item_screen.dart';


final List<String>  items= ['Sachin', 'Rohan', 'Sneha', 'Ram', 'Ravi'];
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {



  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:  DragAndDropItem(items: items),
    );
  }
}


