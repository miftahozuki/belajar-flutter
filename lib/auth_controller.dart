import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AuthController extends GetxController {
  final _box = GetStorage();
  RxBool isLoggedIn = false.obs;

  @override
  void onInit() {
    isLoggedIn.value = _box.read('isLoggedIn') ?? false;
    super.onInit();
  }

  void login() {
    // Simulate login logic here.
    // If login is successful, update the user status and store it.
    isLoggedIn.value = true;
    _box.write('isLoggedIn', true);
  }

  void register() {
    // Simulate registration logic here.
    // If registration is successful, update the user status and store it.
    isLoggedIn.value = true;
    _box.write('isLoggedIn', true);
  }

  void logout() {
    // Log out logic. Update user status and store it.
    isLoggedIn.value = false;
    _box.remove('isLoggedIn');
  }
}
