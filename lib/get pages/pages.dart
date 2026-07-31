// Import the GetX package.
// It provides routing, state management, and dependency injection.
import 'package:get/get.dart';

// Import the PostBinding class.
// This binding creates the PostController before opening the page.
import 'package:new_practice/bindings/post_bindings.dart';

// Import the Posts page (UI screen).
import 'package:new_practice/pages/post.dart';

// Create a class named Pages.
// This class stores all routes (pages) of the application.
class Pages {

  // Create a method that returns a list of GetPage objects.
  // Each GetPage represents one route in the application.
  List<GetPage> getAllPages() {

    // Return a list containing all available routes.
    return [

      // This is a commented route example.
      // It is ignored by Dart because it starts with //.
      // GetPage(name: '/counter', page:() => Counter(), binding: CounterBinding()),

      // Create a route named '/post'.
      // When '/post' is requested:
      // 1. Posts() page will open.
      // 2. PostBinding() will execute first.
      // 3. PostController will be created automatically.
      GetPage(
        name: '/post',                 // Route name
        page: () => Posts(),           // Widget (screen) to display
        binding: PostBinding(),        // Dependency injection
      ),
    ];
  }
}