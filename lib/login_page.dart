import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_borneoapp/login.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Login',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _login() {
    if (_formKey.currentState!.validate()) {
      // Implement your login logic here
      String email = _emailController.text;
      String password = _passwordController.text;
      print('Email: $email, Password: $password');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
                image: DecorationImage(
              image: NetworkImage(
                  'https://th.bing.com/th/id/OIP.0-pk81ynRyEfL-J6nwuMYAHaFJ?rs=1&pid=ImgDetMain'),
              fit: BoxFit.cover,
            )),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
              child: Container(
                color: Colors.black.withOpacity(0),
              ),
            ),
          ),
          Center(
            child: Container(
              padding: EdgeInsets.all(16),
              margin: EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 300,
                    height: 60,
                    decoration: BoxDecoration(
                      image: DecorationImage(image: AssetImage('images/assets/borneotravel.png'))
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (c) => LoginForm()));
                    },
                    child: Container(
                      margin: EdgeInsets.only(top: 100),
                      width: 300,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 0, 97, 187),
                        borderRadius: BorderRadius.circular(4)
                      
                      ),
                      child: Row(
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 10),
                            width: 40,
                            height: 40,
                            child: Image.asset('images/assets/borneotravel2.png'),
                          ),
                          SizedBox(width: 10,),
                          Text('Lanjutkan Dengan Email', style: TextStyle(color: Colors.white),)
                        ],
                      ),
                    ),
                  ),

                  Container(
                    margin: EdgeInsets.symmetric(vertical: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 110,
                          height: 2,
                          color: Colors.white,
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 10),
                          child: Text('Atau', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),),
                        ),
                        Container(
                          color: Colors.white,
                          width: 110,
                          height: 2,
                        )
                      ],
                    ),
                  ),
                   GestureDetector(
                    onTap: () {
                    },
                    child: Container(
                      width: 300,
                      height: 40,
                      
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 66, 103, 178),
                        borderRadius: BorderRadius.circular(4)
                      
                      ),
                      child: Row(
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 10),
                            padding: EdgeInsets.all(4),
                            width: 40,
                            height: 40,
                            child: Image.asset('images/assets/facebooklogo.png'),
                          ),
                          SizedBox(width: 10,),
                          Text('Lanjutkan Dengan Facebook', style: TextStyle(color: Colors.white),)
                        ],
                      ),
                    ),
                  ),
                   GestureDetector(
                    onTap: () {
                    
                    },
                    child: Container(
                      margin: EdgeInsets.only(top: 30),
                      width: 300,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(4)
                      
                      ),
                      child: Row(
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 10),
                            width: 40,
                            height: 40,
                            child: Image.asset('images/assets/googlelogo.png'),
                          ),
                          SizedBox(width: 10,),
                          Text('Lanjutkan Dengan Google', style: TextStyle(color: Colors.black),)
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
      
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
