import 'package:get/get.dart';
import 'package:new_practice/controllers/post_controllers.dart';

class PostBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => PostController());
  }
}
///get by stful