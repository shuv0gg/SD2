// Import Flutter's Material Design widgets (Scaffold, AppBar, Text, etc.)
import 'package:flutter/material.dart';

// Import the GetX package for state management, routing, and dependency injection.
import 'package:get/get.dart';

// Import the binding class that injects dependencies before opening the page.
import 'package:new_practice/bindings/post_bindings.dart';

// Import the file that contains all GetX routes (pages).
import 'package:new_practice/get pages/pages.dart';

// Import the Posts screen widget.
import 'package:new_practice/pages/post.dart';

// Entry point of every Flutter application.
void main() {

  // Starts the Flutter application and loads MyApp as the root widget.
  runApp(const MyApp());
}

// Create a StatefulWidget.
// StatefulWidget is used when the UI may change during runtime.
class MyApp extends StatefulWidget {

  // Constructor of MyApp.
  // super.key helps Flutter identify widgets efficiently.
  const MyApp({super.key});

  // Creates the mutable state object for MyApp.
  @override
  State<MyApp> createState() => _MyAppState();
}

// State class of MyApp.
// All changing variables and UI updates are handled here.
class _MyAppState extends State<MyApp> {

  // build() is called whenever Flutter needs to redraw the UI.
  @override
  Widget build(BuildContext context) {

    // GetMaterialApp is the GetX version of MaterialApp.
    // It provides routing, dependency injection, snackbars,
    // dialogs, and other GetX features.
    return GetMaterialApp(

      // Removes the red "DEBUG" banner from the top-right corner.
      debugShowCheckedModeBanner: false,

      // The first route (page) that opens when the app starts.
      initialRoute: '/post',

      // Loads dependencies before the initial route is opened.
      // Here PostBinding() registers controllers or services.
      initialBinding: PostBinding(),

      // List of all routes (pages) available in the application.
      getPages: Pages().getAllPages(),

      // Home page of the application.
      // NOTE:
      // If initialRoute is provided, 'home' is generally ignored.
      // Usually you should use either 'home' OR 'initialRoute', not both.
      home: Posts(),
    );
  }
}