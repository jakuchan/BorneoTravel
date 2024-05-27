import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class LoginApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Poppins-Regular',
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
      Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(
                  'https://asset.kompas.com/crops/C7HTZr0RDRNxKxVmAN6-mNLo2Bg=/0x0:1000x667/750x500/data/photo/2022/06/26/62b758316726d.jpg',
                ),
                fit: BoxFit.cover)),
      ),
      BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
        child: Container(
          color: Colors.black.withOpacity(0),
        ),
      ),
      Column(
        children: [
          AppBar(
            iconTheme: IconThemeData(color: Colors.white),
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
          Center(
            child: Padding(
              padding: EdgeInsets.only(top: 50, left: 80, right: 80),
              child: Column(
                children: [
                  Image.network(
                    'images/assets/borneotravel.png',
                    width: 350,
                    height: 350,
                  ),
                  Center(
                    child: Center(
                      child: Column(children: [
                        ElevatedButton(
                          style: ButtonStyle(
                              shape: MaterialStatePropertyAll<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10))),
                              backgroundColor: MaterialStatePropertyAll(
                                  Color.fromARGB(255, 0, 97, 187))),
                          onPressed: () {},
                          child: Container(
                            width: 400,
                            height: 50,
                            child: Row(
                              children: [
                                Container(
                                    child: Padding(
                                  padding: EdgeInsets.only(left: 0, right: 20),
                                  child: Image.network(
                                    'images/assets/borneotravel2.png',
                                    width: 60,
                                    height: 60,
                                  ),
                                )),
                                Container(
                                  child: Text(
                                    'Lanjutkan dengan Email',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                       
                        Container(
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width: 150,
                                  height: 2,
                                  color: Colors.white,
                                ),
                                SizedBox(
                                  width: 3,
                                ),
                                Container(
                                    child: Text(
                                  'Atau',
                                  style: TextStyle(color: Colors.white),
                                )),
                                SizedBox(
                                  width: 3,
                                ),
                                Container(
                                  width: 150,
                                  height: 2,
                                  color: Colors.white,
                                )
                              ]),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        ElevatedButton(
                          style: ButtonStyle(
                              shape: MaterialStatePropertyAll<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10))),
                              backgroundColor: MaterialStatePropertyAll(
                                  Color.fromARGB(255, 0, 97, 187))),
                          onPressed: () {},
                        child: Container(
                         width: 400,
                            height: 50,
                            child: Row(
                              children: [
                                Container(
                                    child: Padding(
                                  padding: EdgeInsets.only(left: 0, right: 20),
                                  child: Image.network(
                                    'images/assets/borneotravel2.png',
                                    width: 60,
                                    height: 60,
                                  ),
                                )),
                                Container(
                                  child: Text(
                                    'Lanjutkan dengan Email',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                )
                              ],
                            ),
                        ),
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        ElevatedButton(
                          style: ButtonStyle(
                              shape: MaterialStatePropertyAll<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10))),
                              backgroundColor: MaterialStatePropertyAll(
                                  Color.fromARGB(255, 0, 97, 187))),
                          onPressed: () {},

                        child: Container(
                         width: 400,
                            height: 50,
                            
                            child: Row(
                              
                              children: [
                                Container(
                                    child: Padding(
                                  padding: EdgeInsets.only(left: 0, right: 20),
                                  child: Image.network(
                                    'images/assets/borneotravel2.png',
                                    width: 60,
                                    height: 60,
                                  ),
                                )),
                                Container(
                                  child: Text(
                                    'Lanjutkan dengan Email',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ]),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ]));
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Center(
        child: Text('Welcome!'),
      ),
    );
  }
}
