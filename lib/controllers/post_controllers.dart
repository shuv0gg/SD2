// Import the GetX package.
// It provides state management, reactive variables (.obs),
// controllers, routing, and dependency injection.
import 'package:get/get.dart';

// Import the PostModel class.
// This model represents a single post object.
import 'package:new_practice/models/post_models.dart';

// Import the API service.
// This class is responsible for fetching data from the server.
import 'package:new_practice/network/postApiservice.dart';

// Create a controller.
// GetxController is used to store business logic and application state.
class PostController extends GetxController {

  // Create a reactive list of PostModel.
  // RxList means whenever the list changes,
  // the UI automatically updates.
  RxList<PostModel> _posts = <PostModel>[].obs;

  // Create a reactive boolean variable.
  // Used to show whether data is currently loading.
  RxBool _isLoading = false.obs;

  // Function to fetch posts from the API.
  // async means this function runs asynchronously.
  fetchPosts() async {

    // Before starting the API call,
    // set loading to true.
    _isLoading.value = true;

    // Call the API.
    // Wait until the API returns data.
    // Replace all items inside _posts with the new data.
    _posts.assignAll(await Postapiservice().fetchPosts());

    // API finished.
    // Hide the loading indicator.
    _isLoading.value = false;
  }

  // Getter for posts.
  // Allows other classes to access the posts list
  // without directly modifying _posts.
  List<PostModel> get posts => _posts;

  // Getter for loading state.
  // Returns true if loading,
  // false otherwise.
  bool get isLoading => _isLoading.value;
}