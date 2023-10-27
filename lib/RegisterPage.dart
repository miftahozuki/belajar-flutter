import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';
import 'auth_controller.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<RegisterPage> createState() => _RegisterPage();
}

class _RegisterPage extends State<RegisterPage> {
  // GlobalKey<FormState> _key = new GlobalKey();
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final AuthController authController = Get.find();
  bool _isPasswordVisible = false; 

  void register() {
    // Simulate registration logic
    authController.register();
    Get.offAllNamed('/dashboard');
  }

  DateTime? selectedDate;

  Future<void> _selectDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1950),
      lastDate: DateTime(2099),
    );
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
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
            'Registrasi',
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
                  //bagian fullname
                  padding: EdgeInsets.only(top: 23.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(13.0),
                      ),
                      prefixIcon: Icon(Icons.account_circle_rounded),
                      hintText: '',
                      labelText: 'Fullname',
                    ),
                    validator: MultiValidator([
                      RequiredValidator(errorText: "Nama tidak boleh kosong!"),
                    ]),
                  ),
                ),
                Padding(
                  //bagian email
                  padding: EdgeInsets.only(top: 23.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(13.0),
                      ),
                      prefixIcon: Icon(Icons.email),
                      hintText: '',
                      labelText: 'Email',
                    ),
                    validator: MultiValidator([
                      RequiredValidator(errorText: "Email tidak boleh kosong!"),
                      EmailValidator(errorText: "Email tidak valid")
                    ]),
                    controller: _emailController,
                  ),
                ),
                Padding(
                  //bagian kata sandi
                  padding: EdgeInsets.only(top: 23.0),
                  child: TextFormField(
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
                      MinLengthValidator(8,
                          errorText: "Password harus lebih dari 8 karakter"),
                    ]),
                    obscureText: !_isPasswordVisible,
                  ),
                ),
                Padding(
                  // Bagian tglLahir
                  padding: EdgeInsets.only(top: 23.0),
                  child: TextFormField(
                    controller: TextEditingController(
                      text: selectedDate == null
                          ? ''
                          : DateFormat('dd/MM/yyyy').format(selectedDate!),
                    ),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(13.0),
                      ),
                      prefixIcon: Icon(Icons.calendar_today),
                      labelText: 'Tanggal Lahir',
                    ),
                    validator: MultiValidator([
                      RequiredValidator(errorText: "Pilih tanggal lahir anda!"),
                    ]),
                    readOnly: true,
                    onTap: () => _selectDate(),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 23.0),
                  child: DropdownButtonFormField<String>(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(13.0),
                      ),
                      prefixIcon: Icon(Icons.attribution),
                      labelText: 'Gender',
                    ),
                    onChanged: (String? value) {
                      // Lakukan sesuatu dengan nilai yang dipilih
                    },
                    items: <String>['Laki-laki', 'Wanita'].map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    validator: MultiValidator([
                      //validasi
                    ]),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 23.0),
                  child: DropdownButtonFormField<String>(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(13.0),
                      ),
                      prefixIcon: Icon(Icons.attribution),
                      labelText: 'Agama',
                    ),
                    onChanged: (String? value) {
                      // Lakukan sesuatu dengan nilai yang dipilih
                    },
                    items: <String>[
                      'Islam',
                      'Kristen',
                      'Katholik',
                      'Hindu',
                      'Budha',
                      'Konghucu'
                    ].map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    validator: MultiValidator([
                      //validasi
                    ]),
                  ),
                ),
                Padding(
                  //bagian alamat
                  padding: EdgeInsets.only(top: 23.0),
                  child: TextFormField(
                    // maxLines: 3,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(13.0),
                      ),
                      prefixIcon: Icon(Icons.home),
                      hintText: '',
                      labelText: 'Address',
                    ),
                    validator: MultiValidator([
                      RequiredValidator(
                          errorText: "Alamat tidak boleh kosong!"),
                      MinLengthValidator(8, errorText: "Alamat tidak lengkap!")
                    ]),
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
                        register();
                      }
                    },
                    child:
                        Text('Register', style: TextStyle(color: Colors.white)),
                  ),
                ),
                Padding(
                  //bagian button
                  padding: EdgeInsets.only(top: 25.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Already have an account?'),
                      SizedBox(
                        width: 3,
                      ),
                      TextButton(
                        onPressed: () {
                          Get.offAllNamed('/login');
                        },
                        child: Text(
                          'Back to Login',
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
