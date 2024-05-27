import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_borneoapp/tambah.dart';
import 'dbhelper.dart';
import 'login_page.dart';
import 'wisata.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Borneo travels',
      debugShowCheckedModeBanner: false,
      home: AppGua(),
      theme: ThemeData(
        fontFamily: 'Poppins-Regular',
      ),
    );
  }
}

enum _MenuValues {
  login,
  tambah,
}

// ignore: must_be_immutable
class AppGua extends StatelessWidget {
  AppGua({super.key});

  Future<List<Map<String, dynamic>>> _retrieveData() async {
    DBHelper dbHelper = DBHelper();
    return await dbHelper.queryAllUsers();
  }

  String login1 = 'Login';
  String add1 = 'Tambah Wisata';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: AppBar(
            backgroundColor: Color.fromARGB(255, 0, 97, 187),
            title: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                PopupMenuButton<_MenuValues>(
                    icon: Icon(
                      Icons.menu,
                      color: Colors.white,
                    ),
                    offset: Offset(0, 50),
                    itemBuilder: (BuildContext context) => [
                          PopupMenuItem(
                            child: Text('Login'),
                            value: _MenuValues.login,
                          ),
                          PopupMenuItem(
                            child: Text('Tambahkan Wisata'),
                            value: _MenuValues.tambah,
                          ),
                        ],
                    onSelected: (value) {
                      switch (value) {
                        case _MenuValues.login:
                          Navigator.of(context).push(
                              MaterialPageRoute(builder: (c) => LoginPage()));
                          break;
                        case _MenuValues.tambah:
                          Navigator.of(context).push(
                              MaterialPageRoute(builder: (_) => MyFormPage()));
                        // TODO: Handle this case.
                      }
                    }),
                Container(
                  width: 250,
                  height: 35,
                  child: Image.asset('images/assets/borneotravel.png'),
                ),
                IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.notifications, color: Colors.white)),
              ],
            ),
          ),
        ),
        backgroundColor: Color.fromARGB(255, 202, 202, 202),
        body: ListView(children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 0, left: 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  color: Colors.white,
                  child: Column(
                    children: [
                      Container(
                        child: Padding(
                          padding: EdgeInsets.only(
                              top: 20, left: 30, right: 10, bottom: 15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Eksplor',
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.bold),
                              ),
                              const Text(
                                'Tempat wisata, hotel, dan lainnya',
                                style: TextStyle(fontSize: 12),
                              ),
                              const SizedBox(
                                  height:
                                      20), // Memberikan ruang antara teks dan kotak pencarian
                              Container(
                                height: 40,
                                padding: const EdgeInsets.only(right: 20),
                                child: TextFormField(
                                  style: TextStyle(fontSize: 15),
                                  decoration: const InputDecoration(
                                    contentPadding: EdgeInsets.only(bottom: 3),
                                    hintText: 'Cari',
                                    prefixIcon: Icon(
                                      Icons.search,
                                      color: Colors.black,
                                    ),
                                    border: OutlineInputBorder(),
                                    filled: true,
                                    fillColor: Color(0xFFD9D9D9),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 10),
                              ElevatedButton(
                                style: ButtonStyle(
                                  backgroundColor: MaterialStatePropertyAll(
                                      Color.fromARGB(255, 0, 97, 187)),
                                  shape: MaterialStatePropertyAll<
                                          RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10))),
                                ),

                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) => HasilPage()),
                                  );
                                },
                                // style: ElevatedButton.styleFrom(
                                //   foregroundColor: Colors.white,
                                //   backgroundColor: const Color.fromARGB(255, 0, 97, 187), // Warna teks
                                // ),
                                child: const Text('Cari',
                                    style: TextStyle(color: Colors.white)),
                              ),
                            ],
                          ),
                        ),
                      ),
                      // Memberikan ruang antara kotak pencarian dan tombol
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  color: Colors.white,
                  child: Column(
                    children: [
                      Container(
                        child: Padding(
                          padding:
                              EdgeInsets.only(top: 20, left: 30, bottom: 15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                padding: EdgeInsets.only(bottom: 20),
                                child: Row(
                                  children: [
                                    Text('Populer di ',
                                        style: TextStyle(fontSize: 15)),
                                    Text(
                                      'Kalimantan Selatan',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15),
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  padding: EdgeInsets.only(right: 20),
                                  child: Row(children: [
                                    Container(
                                      width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                      height: 120,
                                      color: Colors.amber,
                                      child: FutureBuilder<List<Map<String, dynamic>>>(
                                          future: _retrieveData(),
                                          builder: (context, snapshot) {
                                            if (snapshot.connectionState ==
                                                ConnectionState.waiting) {
                                              return Center(
                                                  child:
                                                      CircularProgressIndicator());
                                            } else if (snapshot.hasError) {
                                              return Center(
                                                  child: Text(
                                                      'Error: ${snapshot.error}'));
                                            } else if (!snapshot.hasData ||
                                                snapshot.data!.isEmpty) {
                                              return Center(
                                                  child: Text('Kosong Bnag'));
                                            } else {
                                              return ListView.builder(
                                                  itemCount:
                                                      snapshot.data!.length,
                                                  itemBuilder: (context, index) {
                                                    var user =
                                                        snapshot.data![index];
                                                    return Container(
                                                    width: 100,
                                                    height: 100,
                                                    decoration: BoxDecoration(
                                                      image: DecorationImage(image: NetworkImage('${user['image']}'))
                                                    ),
                                                    );
                                                  });
                                            }
                                          }),
                                    ),
                                  ]),
                                ),

                                // Memberikan ruang antara kotak pencarian dan tombol
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        color: Colors.white,
                        child: Column(
                          children: [
                            Container(
                              child: Padding(
                                padding: EdgeInsets.only(
                                    top: 20, left: 30, bottom: 15),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      padding: EdgeInsets.only(bottom: 20),
                                      child: Row(
                                        children: [
                                          Text('Promo Hari Ini',
                                              style: TextStyle(fontSize: 15)),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      child: SingleChildScrollView(
                                        scrollDirection: Axis.horizontal,
                                        padding: EdgeInsets.only(right: 20),
                                        child: Row(
                                          children: [
                                            Column(children: <Widget>[
                                              Container(
                                                width: 200,
                                                height: 100,
                                                child: Image.network(
                                                  'https://th.bing.com/th/id/OIP.qqmrQEpbjlA1dxmZcpX6twHaFN?rs=1&pid=ImgDetMain',
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Text('Promo Hari Raya')
                                            ]),
                                            SizedBox(
                                              width: 20,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),

                            // Memberikan ruang antara kotak pencarian dan tombol
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        color: Colors.white,
                        child: Column(
                          children: [
                            Container(
                              child: Padding(
                                padding: EdgeInsets.only(
                                    top: 20, left: 30, bottom: 15),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      padding: EdgeInsets.only(bottom: 20),
                                      child: Row(
                                        children: [
                                          Text('Lanjutkan Pencarian',
                                              style: TextStyle(fontSize: 15)),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      child: SingleChildScrollView(
                                        scrollDirection: Axis.horizontal,
                                        padding: EdgeInsets.only(right: 20),
                                        child: Row(
                                          children: [
                                            Column(children: <Widget>[
                                              Container(
                                                width: 200,
                                                height: 100,
                                                child: Image.network(
                                                  'https://th.bing.com/th/id/OIP.qqmrQEpbjlA1dxmZcpX6twHaFN?rs=1&pid=ImgDetMain',
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Text(
                                                  'Banjarmasin, Kalimantan Selatan')
                                            ]),
                                            SizedBox(
                                              width: 20,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),

                            // Memberikan ruang antara kotak pencarian dan tombol
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ]));
  }
}
