import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'auth_controller.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<DashboardPage> createState() => _DashboardPage();
}

class _DashboardPage extends State<DashboardPage> {
  // GlobalKey<FormState> _key = new GlobalKey();
  final _formKey = GlobalKey<FormState>();
  // final _emailController = TextEditingController();
  final AuthController authController = Get.find();

  void logout() {
    Get.defaultDialog(
      title: "Konfirmasi Logout",
      middleText: "Apakah Anda yakin ingin logout?",
      textCancel: "Batal",
      textConfirm: "Logout",
      onConfirm: () {
        authController.logout();
        Get.offAllNamed('/login');
      },
    );
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
                  ElevatedButton(
                    onPressed: () {
                      logout(); // Panggil method logout saat tombol ditekan
                    },
                    child: Padding(
                      padding:
                          EdgeInsets.all(20.0), // Atur padding sesuai kebutuhan
                      child: Text("Logout"),
                    ),
                  ),
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
            'Dashboard Page',
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
                  child: Text('My Dashboard Page'),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
