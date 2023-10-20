import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<RegisterPage> createState() => _RegisterPage();
}

class _RegisterPage extends State<RegisterPage> {
  DateTime? selectedDate;

  Future<void> _selectDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1945),
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
                  labelText: 'Username'),
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
                  labelText: 'Fullname'),
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
                  labelText: 'Email'),
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
                  labelText: 'Password'),
              obscureText: true,
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
              onChanged: (String) {
                //aksi
              },
              items: <String>['Laki-laki', 'Wanita'].map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
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
              onChanged: (String) {
                //aksi
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
                    labelText: 'Address'),
              )),
          Padding(
            //bagian button
            padding: EdgeInsets.only(top: 25.0),
            child: MaterialButton(
              color: Colors.blue,
              height: 50,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              onPressed: () {},
              child: Text('Register', style: TextStyle(color: Colors.white)),
            ),
          ),
        ],
      ),
    );
  }
}
