import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_borneoapp/main.dart';
import 'detail_page.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/widgets.dart';
import 'dbhelper.dart';

// ignore: must_be_immutable
class HasilPage extends StatefulWidget {
  const HasilPage({Key? key}) : super(key: key);


  @override
  State<HasilPage> createState() => _HasilPageState();

  
}
 class HasilApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
    '/': (context) => AppGua(),
    '/detail': (context) => const DetailPage(product: {},),
  },
    );
  }
}

class _HasilPageState extends State<HasilPage> {
  
  Future<List<Map<String, dynamic>>> _retrieveData() async {
    DBHelper dbHelper = DBHelper();
    return await dbHelper.queryAllUsers();
    
  }

  
  @override
  Widget build(BuildContext) {
    
    return Scaffold(
    
        backgroundColor: Color.fromARGB(255, 202, 202, 202),
        appBar:  AppBar(
              automaticallyImplyLeading: false,
              backgroundColor: const Color.fromARGB(255, 0, 97, 187),
              leading: BackButton( color: Colors.white,),
              title: Text('Wisata', style: TextStyle(color: Colors.white),),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
              Container(
                padding: EdgeInsets.only(bottom: 10),
                width: MediaQuery.of(context).size.width,
                height: 730,
                
                 child: Column(
                   children: [
                    
                     Expanded(
                       child: FutureBuilder<List<Map<String, dynamic>>>(
                            future: _retrieveData(),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return Center(child: CircularProgressIndicator());
                              } else if (snapshot.hasError) {
                                return Center(
                                    child: Text('Error: ${snapshot.error}'));
                              } else if (!snapshot.hasData ||
                                  snapshot.data!.isEmpty) {
                                return Center(child: Text('Tidak ada data'));
                              } else {
                                return ListView.builder(
                                    itemCount: snapshot.data!.length,
                                    key: ValueKey(snapshot.data!),
                                    itemBuilder: (context, index) {
                                      var user = snapshot.data![index];
                                      return Container(
                                        
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            GestureDetector(
                                              onTap: () {
                                                Navigator.of(context, rootNavigator: true).pushNamed(
                                                  '/detail',
                                                  arguments: user,
                                                  
                                            
                                                  
                                                );
                                              },
                                            child: Container(
                                              margin: EdgeInsets.only(top: 20),
                                              width: 380,
                                              height: 300,
                                                decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(20),
                                                  color: Colors.white
                                                ),
                                                
                                              child: Row(
                                                children: [
                                                  Container(
                                                    width: 150,
                                                    height: MediaQuery.of(context)
                                                        .size
                                                        .height,
                                                        decoration: BoxDecoration(
                                                          image: DecorationImage(image: NetworkImage( '${user['image']}',), fit: BoxFit.cover ),
                                                          borderRadius: BorderRadius.only(topLeft:Radius.circular(20), bottomLeft: Radius.circular(20)),
                                                          color: Colors.yellow
                                       
                                                        ),
                                                  ),
                                                  SizedBox(width: 5,),
                                                  Container(
                                                    
                                                    child: Padding(
                                                      padding: const EdgeInsets.only(top: 20, left: 10),
                                                      child: Column(
                                                        mainAxisAlignment: MainAxisAlignment.start,
                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                        children: [
                                                          Container(
                                                            width: 200,
                                                            child: AutoSizeText('${user['name']}', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17), minFontSize: 10,maxLines: 1, overflow: TextOverflow.ellipsis,)),
                                                          SizedBox(height: 10,),
                                                          Row(
                                                            children: [
                                                              Container(
                                                                width: 60,
                                                                height: 30,
                                                                decoration: BoxDecoration(
                                                                  border: Border.all(color: Colors.black),
                                                                  borderRadius: BorderRadius.circular(5),
                                                                ),
                                                                child: Row(
                                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                                  crossAxisAlignment: CrossAxisAlignment.center,
                                                                  children: [
                                                                    Text('${user['type']}'),
                                                                  ]
                                                                ),
                                                                
                                                              ),
                                                              Container(
                                                                height: 30,
                                                                width: 125,
                                                                child: Row(
                                                                  mainAxisAlignment: MainAxisAlignment.end,
                                                                  crossAxisAlignment: CrossAxisAlignment.center,
                                                                  children: [
                                                                    Icon(Icons.star_rounded, color: Colors.grey,),
                                                                    Icon(Icons.star_rounded, color: Colors.grey,),
                                                                    Icon(Icons.star_rounded, color: Colors.grey,),
                                                                    Icon(Icons.star_rounded, color: Colors.grey,),
                                                                    Icon(Icons.star_rounded, color: Colors.grey,)
                                                                  ],
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                          Container(
                                                            margin: EdgeInsets.only(top: 80),
                                                            width: 200,
                                                            height: 130,
                                                            child: Column(
                                                              mainAxisAlignment: MainAxisAlignment.start,
                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                              children: [
                                                                Text('Harga masuk: ', style: TextStyle(fontWeight: FontWeight.bold),),
                                                                Text('Rp ' + '${user['price']}'),
                                                                SizedBox(height: 10,),
                                                                Text('Jam Buka/Tutup: ', style: TextStyle(fontWeight: FontWeight.bold)),
                                                                Text('${user['day']}'),
                                                                Text('${user['time']}'),
                                                              ],
                                                              
                                                            ),
                                                            
                                                          )
                                                          
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            )
                                            )
                                          ],
                                        ),
                                      );
                                    });
                              }
                            }),
                     ),
                   ],
                 ),
                ),
              
            
          
       ] ));
  }
  
}
