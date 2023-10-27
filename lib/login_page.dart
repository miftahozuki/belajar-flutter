import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';
import 'package:latihan1/dashboard_page.dart';
import 'auth_controller.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<LoginPage> createState() => _LoginPage();
}

class _LoginPage extends State<LoginPage> {
  // GlobalKey<FormState> _key = new GlobalKey();
  final _formKey = GlobalKey<FormState>();
  // final _emailController = TextEditingController();
  final AuthController authController = Get.find();
  bool _isPasswordVisible = false;
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();


  // void login() {
  //   // Simulate registration logic
  //   // authController.login();
  //   Get.offAllNamed('/dashboard');
  // }

  void login() {
  String enteredUsername = usernameController.text;
  String enteredPassword = passwordController.text;

  // Sekarang, Anda bisa memeriksa dan memproses nilai-nilai tersebut.
  // Contoh:
  if (enteredUsername == "admin" && enteredPassword == "admin") {
    Get.to(const DashboardPage(title: 'Dashboard'));
    // Get.offAllNamed('/dashboard');
        // ...
  } else {
    Get.snackbar(
        "Login Error",
        "Username atau password salah.",
        snackPosition: SnackPosition.BOTTOM,
    );
    // ...
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        shrinkWrap: true,
        children: <Widget>[
          Form(
            child: Container(
              padding: EdgeInsets.all(18.0),
              alignment: Alignment.bottomCenter,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  regScreen(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget regScreen() {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 14.0),
            child:
                Icon(Icons.account_box_rounded, color: Colors.blue, size: 70),
          ),
          Text(
            'Login',
            style: TextStyle(
              fontSize: 30,
              color: Colors.blueGrey,
              fontWeight: FontWeight.bold,
            ),
          ),
          Form(
            key: _formKey,
            autovalidateMode: AutovalidateMode.disabled,
            child: Column(
              children: [
                Padding(
                  //bagian username
                  padding: EdgeInsets.only(top: 23.0),
                  child: TextFormField(
                    controller: usernameController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(13.0),
                      ),
                      prefixIcon: Icon(Icons.account_circle_outlined),
                      hintText: '',
                      labelText: 'Username',
                    ),
                    validator: MultiValidator([
                      RequiredValidator(
                          errorText: "Username tidak boleh kosong!"),
                      MinLengthValidator(5,
                          errorText: "username harus lebih dari 5 karakter")
                    ]),
                  ),
                ),
                Padding(
                  //bagian kata sandi
                  padding: EdgeInsets.only(top: 23.0),
                  child: TextFormField(
                    controller: passwordController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(13.0),
                      ),
                      prefixIcon: Icon(Icons.password),
                      hintText: 'Password',
                      labelText: 'Password',
                      suffixIcon: GestureDetector(
                        // Tambahkan GestureDetector untuk mengubah status tampilan password
                        onTap: () {
                          setState(() {
                            _isPasswordVisible = !_isPasswordVisible;
                          });
                        },
                        child: Icon(
                          _isPasswordVisible
                              ? Icons.visibility_off
                              : Icons.visibility, // Ikon mata
                        ),
                      ),
                    ),
                    validator: MultiValidator([
                      RequiredValidator(
                          errorText: "Password tidak boleh kosong!"),
                      MinLengthValidator(3,
                          errorText: "Password harus lebih dari 8 karakter"),
                    ]),
                    obscureText: !_isPasswordVisible,
                  ),
                ),
                Padding(
                  //bagian button
                  padding: EdgeInsets.only(top: 25.0),
                  child: MaterialButton(
                    color: Colors.blue,
                    height: 50,
                    minWidth: double.infinity,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        // Jika validasi berhasil, lakukan tindakan yang diinginkan
                        login();
                      }
                    },
                    child: Text('Login', style: TextStyle(color: Colors.white)),
                  ),
                ),
                Padding(
                  //bagian button
                  padding: EdgeInsets.only(top: 25.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Dont have an account yet?'),
                      SizedBox(
                        width: 3,
                      ),
                      TextButton(
                        onPressed: () {
                          Get.toNamed('/register');
                        },
                        child: Text(
                          'Sign Up',
                          style: TextStyle(color: Colors.blueAccent),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
