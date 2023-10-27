import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:path_provider/path_provider.dart';

import 'auth_controller.dart';

import 'dashboard_page.dart';
import 'package:latihan1/login_page.dart';
import 'RegisterPage.dart';

void main() async {
  await GetStorage.init();
  Get.put(AuthController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Aplikasiku',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a blue toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // home: const LoginPage(title: 'Halaman Register'),
      initialRoute: '/login',
      getPages: [
        GetPage(
            name: '/login',
            page: () => LoginPage(
                  title: 'login',
                )),
        GetPage(
            name: '/register',
            page: () => RegisterPage(
                  title: 'register',
                )),
        GetPage(
            name: '/dashboard',
            page: () => DashboardPage(
                  title: 'dashboard',
                )),
      ],
      debugShowCheckedModeBanner: false,
    );
  }
}
