import 'package:get/get.dart';
import 'package:pedfi/pages/auth/auth_controller.dart';

class AuthBindings extends Bindings {

  @override
  void dependencies() {
    Get.lazyPut(() => AuthController());
  }
}