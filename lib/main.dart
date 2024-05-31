import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
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
class AppGua extends StatefulWidget {
  AppGua({super.key});

  @override
  State<AppGua> createState() => _AppGuaState();
}

class _AppGuaState extends State<AppGua> {
  Future<List<Map<String, dynamic>>> _retrieveData() async {
    DBHelper dbHelper = DBHelper();
    return await dbHelper.queryAllUsers();
  }

  int activeIndex = 0;

  final urlImages = [
    'https://4.bp.blogspot.com/-gNwZD0qekTg/VvT-FBcKa0I/AAAAAAAAABk/1lzBtDm-f9o2MDOwXjISRaVYn5MZRqTSQ/s1600/100_3244.jpg',
    'https://4.bp.blogspot.com/-gNwZD0qekTg/VvT-FBcKa0I/AAAAAAAAABk/1lzBtDm-f9o2MDOwXjISRaVYn5MZRqTSQ/s1600/100_3244.jpg',
    'https://4.bp.blogspot.com/-gNwZD0qekTg/VvT-FBcKa0I/AAAAAAAAABk/1lzBtDm-f9o2MDOwXjISRaVYn5MZRqTSQ/s1600/100_3244.jpg',
    'https://4.bp.blogspot.com/-gNwZD0qekTg/VvT-FBcKa0I/AAAAAAAAABk/1lzBtDm-f9o2MDOwXjISRaVYn5MZRqTSQ/s1600/100_3244.jpg',
    'https://4.bp.blogspot.com/-gNwZD0qekTg/VvT-FBcKa0I/AAAAAAAAABk/1lzBtDm-f9o2MDOwXjISRaVYn5MZRqTSQ/s1600/100_3244.jpg',
  ];

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
                    if (value case _MenuValues.login) {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (c) => LoginPage()));
                    } else if (value case _MenuValues.tambah) {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (_) => MyFormPage()));
                    }
                  }),
              Container(
                width: 250,
                height: 35,
                child: Image.asset('images/assets/borneotravel.png'),
              ),
              IconButton(
                icon: Icon(
                  Icons.notifications,
                  color: Colors.white,
                ),
                onPressed: () {
                  showGeneralDialog(
                    context: context,
                    barrierDismissible: true,
                    barrierLabel: MaterialLocalizations.of(context)
                        .modalBarrierDismissLabel,
                    pageBuilder: (BuildContext buildContext,
                        Animation animation, Animation secondaryAnimation) {
                      return SafeArea(
                        child: Builder(
                          builder: (BuildContext context) {
                            return Align(
                              alignment: Alignment
                                  .topCenter, // Ubah posisi dialog di sini
                              child: Container(
                                height: 220,
                                child: Material(
                                  color: Colors.transparent,
                                  
                                  child: Container(
                                    child: Column(
                                      children: [
                                        Container(
                                          padding: EdgeInsets.symmetric(horizontal: 10),
                                          width: MediaQuery.of(context).size.width *
                                              0.8,
                                          height: 40,
                                          margin: EdgeInsets.only(
                                              top:
                                                  50.0), // Ubah margin untuk memposisikan dialog
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            border: Border(bottom: BorderSide(
                                              width: 1,
                                              color: Colors.grey
                                            ))
                                          ),
                                          child: Row(
                                            
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [
                                              Text(
                                                'Notifikasi',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 17),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          width: MediaQuery.of(context).size.width *
                                              0.8,
                                          height: 130,
                                          color: Colors.white,
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [
                                              Text('infoNotifikasi')
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      );
                    },
                  );
                },
              )
            ],
          ),
        ),
      ),
      backgroundColor: Color.fromARGB(255, 202, 202, 202),
      body: ListView(
        children: <Widget>[
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
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              CarouselSlider.builder(
                                itemCount: urlImages.length,
                                itemBuilder: (context, index, realIndex) {
                                  final urlImage = urlImages[index];
                                  return Container(
                                      width: 500,
                                      height: 100,
                                      child: buildImage(
                                        urlImage,
                                        index,
                                      ));
                                },
                                options: CarouselOptions(
                                    height: 200,
                                    autoPlay: true,
                                    autoPlayInterval: Duration(seconds: 12),
                                    enableInfiniteScroll: false,
                                    autoPlayAnimationDuration:
                                        Duration(seconds: 2),
                                    enlargeCenterPage: true,
                                    onPageChanged: (index, reason) =>
                                        setState(() => activeIndex = index)),
                              ),
                              SizedBox(
                                height: 12,
                              ),
                              buildIndicator()
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
            margin: const EdgeInsets.only(top: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  color: Colors.white,
                  child: Column(children: [
                    Container(
                      child: Padding(
                        padding: EdgeInsets.only(top: 20, left: 30, bottom: 15),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                padding: EdgeInsets.only(bottom: 20),
                                child: Row(
                                  children: [
                                    Text('Destinasi Populer ',
                                        style: TextStyle(
                                            fontSize: 17,
                                            fontWeight: FontWeight.bold)),
                                  ],
                                ),
                              ),
                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Container(
                                  width: MediaQuery.of(context).size.width,
                                  height: 190,
                                  child:
                                      FutureBuilder<List<Map<String, dynamic>>>(
                                    future: _retrieveData(),
                                    builder: (context, snapshot) {
                                      if (snapshot.connectionState ==
                                          ConnectionState.waiting) {
                                        return Center(
                                            child: CircularProgressIndicator());
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
                                          scrollDirection: Axis.horizontal,
                                          itemCount: snapshot.data!.length,
                                          itemBuilder: (context, index) {
                                            var user = snapshot.data![index];
                                            return Container(
                                                margin:
                                                    EdgeInsets.only(right: 40),
                                                child: Column(
                                                  children: [
                                                    GestureDetector(
                                                      onTap: () {
                                                        Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                            builder:
                                                                (context) =>
                                                                    HasilPage(),
                                                          ),
                                                        );
                                                      },
                                                      child: Container(
                                                        width: 200,
                                                        height: 130,
                                                        decoration:
                                                            BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            5),
                                                                image:
                                                                    DecorationImage(
                                                                  image: NetworkImage(
                                                                      '${user['image']}'),
                                                                  fit: BoxFit
                                                                      .cover,
                                                                )),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 10,
                                                    ),
                                                    Container(
                                                      width: 200,
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            '${user['city']}',
                                                            style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                          Text(
                                                              '${user['province']}')
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ));
                                          },
                                        );
                                      }
                                    },
                                  ),
                                ),
                              ),
                            ]),
                      ),

                      // Memberikan ruang antara kotak pencarian dan tombol
                    ),
                  ]),
                )
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 10),
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
                                    Text('Promo Hari Ini',
                                        style: TextStyle(
                                            fontSize: 17,
                                            fontWeight: FontWeight.bold)),
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
                                            height: 130,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              image: DecorationImage(
                                                image: NetworkImage(
                                                    'https://th.bing.com/th/id/OIP.qqmrQEpbjlA1dxmZcpX6twHaFN?rs=1&pid=ImgDetMain'),
                                                fit: BoxFit.cover,
                                              ),
                                            )),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Container(
                                            width: 200,
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text('Promo Hari Raya'),
                                              ],
                                            ))
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
            margin: const EdgeInsets.only(top: 10),
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
                                    Text('Lanjutkan Pencarian',
                                        style: TextStyle(
                                            fontSize: 17,
                                            fontWeight: FontWeight.bold)),
                                  ],
                                ),
                              ),
                              Container(
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    children: [
                                      Container(
                                        width: 200,
                                        height: 130,
                                        decoration: BoxDecoration(
                                            color: Colors.grey,
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                      )
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
    );
  }

  Widget buildIndicator() => AnimatedSmoothIndicator(
      effect: ExpandingDotsEffect(
          dotWidth: 8,
          dotHeight: 8,
          activeDotColor: Color.fromARGB(255, 0, 97, 187)),
      activeIndex: activeIndex,
      count: urlImages.length);

  Widget buildImage(String urlImage, int index) => Container(
      margin: EdgeInsets.symmetric(horizontal: 5),
      child: Image.network(
        urlImage,
        fit: BoxFit.cover,
      ));
}
