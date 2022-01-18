import 'package:flutter/material.dart';

void main() {
  // program starts executing here
  runApp(
      MyApp()); // global function which takes a widget as argument and inflects it to the screen
}

// type st into editor and you'll get a snippet
class MyApp extends StatelessWidget {
  // StatelessWidget = class that you use to create a UI element that has no dynamic data (widget that paints some pixels to the screen)
  // www.youtube.com/watch?v=wE7khGHVkYY -> Widgets 101
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // the build method = returns a widget and will be called everytime Flutter needs to rebuild the UI - e.g. when the data changes
    return MaterialApp(
      home: Scaffold(
        // Scaffold = Visual layout structure
        // allow you to build screens with common UI elements e.g. an appbar
        appBar: AppBar(
          // every pre-built widget has a banch of named parameters where you can customize its appearance
          // put your mouse pointer inside the widget and hit ctrl+space to see all the options
          backgroundColor: Colors.green,
          title: const Text('Flutter is fun!'),
        ),
        body: Container(
          // layout = how to move widgets around
          // container = box. Like a div tag in html
          // takes one child as argument
          // body: Center. child: Padding, SizedBox
          child: const Text('Hi mom'),
          margin: const EdgeInsets.all(10),
          padding: const EdgeInsets.all(10),
          color: Colors.red,
          height: 100,
          width: 100,
          // decoration: BoxDecoration(
          //   // using the decoration property, we can make the box look better
          // ),
        ),
      ),
    );
  }
}
