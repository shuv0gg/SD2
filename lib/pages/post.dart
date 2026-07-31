// Import Cupertino widgets (iOS-style icons and widgets).
// Here, it is used for the refresh icon.
import 'package:flutter/cupertino.dart';

// Import Material Design widgets such as Scaffold,
// AppBar, Text, ListView, FloatingActionButton, etc.
import 'package:flutter/material.dart';

// Import the GetX package.
// Used for state management and dependency injection.
import 'package:get/get.dart';

// Import the PostController.
// This controller contains the API logic and post data.
import 'package:new_practice/controllers/post_controllers.dart';

// Create the Posts screen.
// GetView<PostController> automatically provides access
// to the registered PostController using 'controller'.
class Posts extends GetView<PostController> {

  // Constructor of Posts widget.
  const Posts({super.key});

  // build() creates the UI of this screen.
  @override
  Widget build(BuildContext context) {

    // Scaffold provides the basic Material Design layout.
    return Scaffold(

      // Floating button displayed at the bottom-right.
      floatingActionButton: FloatingActionButton(

        // Called when the button is pressed.
        onPressed: () {

          // Fetch posts from the API.
          controller.fetchPosts();
        },

        // Icon displayed inside the button.
        child: Icon(CupertinoIcons.refresh),
      ),

      // Top AppBar of the screen.
      appBar: AppBar(

        // Title displayed in the AppBar.
        title: Text("Api Call Example"),

        // Center the title.
        centerTitle: true,
      ),

      // Main body of the screen.
      body: Obx(

        // Obx listens to reactive (.obs) variables.
        // Whenever posts change,
        // this widget rebuilds automatically.
            () => ListView.builder(

          // Number of items in the list.
          itemCount: controller.posts.length,

          // Builds each list item one by one.
          itemBuilder: (context, index) {

            // One row of the list.
            return ListTile(

              // Display the title of the post.
              title: Text(controller.posts[index].title),

              // Display the body of the post.
              subtitle: Text(controller.posts[index].body),
            );
          },
        ),
      ),
    );
  }
}