import 'package:flutter/material.dart';


class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<RegisterPage> createState() => _RegisterPage();
}

class _RegisterPage extends State<RegisterPage> {


  @override
    Widget build(BuildContext context) {
    return Scaffold(
      // key: _scaffoldKey,
      backgroundColor: Colors.white,
      body: ListView(
        shrinkWrap: true,
        children: <Widget>[
          Form(
            // key: _formKey,
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
}

regScreen() {
  return Container(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          
          Padding(
            padding: EdgeInsets.only(top: 14.0),
            child: Icon(
              Icons.account_box_rounded,
              color: Colors.blue,
              size: 70),
          ),
          
          Text(
          'Registrasi',
            style: TextStyle(
              fontSize: 30,
              color: Colors.blueGrey,
              fontWeight: FontWeight.bold,
            ),
          ),


          Padding( //bagian username
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
          Padding( //bagian fullname
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
          Padding( //bagian email
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
          Padding( //bagian kata sandi
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
          Padding( //bagian tglLahir
            padding: EdgeInsets.only(top: 23.0),
            child: TextFormField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(13.0),
                  ),
                  prefixIcon: Icon(Icons.calendar_month),
                  hintText: '',
                  labelText: 'Tanggal Lahir'),
            // onTap: () {
            //   showDatePicker(context: context, initialDate: DateTime.now(), firstDate: DateTime(2000), lastDate: DateTime(2099));
            // }
            ),
          ),
          Padding( //bagian gender
            padding: EdgeInsets.only(top: 23.0),
            child: TextFormField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(13.0),
                  ),
                  prefixIcon: Icon(Icons.attribution),
                  hintText: '',
                  labelText: 'Gender'),
            ),
          ),
          Padding( //bagian agama
            padding: EdgeInsets.only(top: 23.0),
            child: TextFormField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(13.0),
                  ),
                  prefixIcon: Icon(Icons.ballot),
                  hintText: '',
                  labelText: 'Religion'),
            ),
          ),
          Padding( //bagian alamat
            padding: EdgeInsets.only(top: 23.0),
            child: TextFormField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(13.0),
                  ),
                  prefixIcon: Icon(Icons.home),
                  hintText: '',
                  labelText: 'Address'),
            ),
          ),
          Padding(//bagian button
            padding: EdgeInsets.only(top: 25.0),
            child: MaterialButton(
              color: Colors.blue,
              height: 50,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              onPressed: () {

              },
              child:
                  Text('Register', style: TextStyle(color: Colors.white)),
            ),
          ),
        ]
    )
  );
}

//gender, agama, alamat, submit