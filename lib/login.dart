import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
              automaticallyImplyLeading: false,
              backgroundColor: const Color.fromARGB(255, 0, 97, 187),
              leading: BackButton( color: Colors.white,),
              title: Text('Login', style: TextStyle(color: Colors.white),),
        ),

        body: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              SizedBox(height: 30,),
              Text('Masukkan Email dan Password Anda', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
              SizedBox(height: 30,),
              Container(

                width: MediaQuery.of(context).size.width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TextFormField(
                              decoration:
                                  const InputDecoration(labelText: 'Email'),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Mohon Isi Email';
                                }
                                return null;
                              },
                            ),
                            TextFormField(
                              decoration:
                                  const InputDecoration(labelText: 'Password'),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Mohon Isi Password';
                                }
                                return null;
                              },
                            ),
                            SizedBox(height: 30,),
                            ElevatedButton(onPressed:() {
                              
                            }, child: Text('Login'))
                  ],
                ),
              )
            ],
          ),
        ),
    );
  }
}