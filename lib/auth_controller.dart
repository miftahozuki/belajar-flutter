import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AuthController extends GetxController {
  final api ='https://learn-flutter-ec403-default-rtdb.asia-southeast1.firebasedatabase.app/Users.json';
  final _box = GetStorage();
  RxBool isLoggedIn = false.obs;
  Map<String, dynamic>? authenticatedUser;

  @override
  void onInit() {
    isLoggedIn.value = _box.read('isLoggedIn') ?? false;
    super.onInit();
  }

  Future<bool> login(String username, String password) async {
    final response = await http.get(Uri.parse(api));

    if (response.statusCode == 200) {
      final List<dynamic> userData = json.decode(response.body);
      final user = userData.firstWhere(
        (user) => user['username'] == username && user['password'] == password,
        orElse: () => null,
      );
      authenticatedUser = user;
      return user != null;
    } else {
      print("kesalahan server!");
      return false;
    }
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
