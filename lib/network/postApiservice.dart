// Import the Dio package.
// Dio is a powerful HTTP client used to make API requests.
import 'package:dio/dio.dart';

// Import the PostModel class.
// We will convert JSON data into PostModel objects.
import 'package:new_practice/models/post_models.dart';

// Create a service class responsible for API calls.
class Postapiservice {

  // Create a private Dio object.
  // 'final' means the reference cannot be changed after initialization.
  final Dio _dio = Dio(

    // Configure Dio using BaseOptions.
    BaseOptions(

      // Base URL of the API.
      // Every request will start with this URL.
      baseUrl: 'https://jsonplaceholder.typicode.com/',

      // Maximum time allowed to establish a connection.
      // If it takes more than 10 seconds, Dio throws an exception.
      connectTimeout: const Duration(seconds: 10),

      // Maximum time to wait for the server's response.
      receiveTimeout: const Duration(seconds: 10),
    ),
  );

  // Function to fetch posts from the API.
  // async means this function runs asynchronously.
  fetchPosts() async {

    // Try block is used because API calls may fail.
    try {

      // Send a GET request to:
      // https://jsonplaceholder.typicode.com/posts
      var _response = await _dio.get('/posts');

      // Check whether the server returned success.
      if (_response.statusCode == 200) {

        // Store JSON response in a List.
        // The API returns an array of objects.
        List<dynamic> data = _response.data;

        // Convert every JSON object into a PostModel object.
        return data.map((item) {

          // Create one PostModel from one JSON object.
          return PostModel(

            // Assign JSON values to model properties.
            userId: item['userId'],
            id: item['id'],
            title: item['title'],
            body: item['body'],
          );

          // Convert Iterable<PostModel> into List<PostModel>.
        }).toList();

      } else {

        // If the response status is not 200,
        // throw a custom exception.
        throw Exception('Api Couldnot be reached');
      }

    } catch (e) {

      // Catch any error (network error, timeout, etc.)
      // and throw it again as a string.
      throw e.toString();
    }
  }
}