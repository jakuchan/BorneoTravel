import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'dbhelper.dart';

// ignore: must_be_immutable
class HasilPage extends StatefulWidget {
  const HasilPage({Key? key}) : super(key: key);

  @override
  State<HasilPage> createState() => _HasilPageState();
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
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: AppBar(
              automaticallyImplyLeading: false,
              backgroundColor: const Color.fromARGB(255, 0, 97, 187),
              title: Center(
                child: Container(
                  width: 500,
                  height: 40,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        color: Colors.grey,
                      )),
                  child: Row(
                    children: [
                      BackButton(
                        style:
                            ButtonStyle(iconSize: MaterialStatePropertyAll(20)),
                      ),
                      Text(
                        'Nama Tempat',
                        style: TextStyle(
                            fontWeight: FontWeight.w200, fontSize: 15),
                      )
                    ],
                  ),
                ),
              )),
        ),
        body: Column(
          children: [
            Column(children: [
              Container(
                  padding: EdgeInsets.all(0),
                  child: Padding(
                      padding: EdgeInsets.only(top: 10, bottom: 10),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                              padding: EdgeInsets.all(0),
                              child: Container(
                                  child: Row(
                                children: [],
                              )))
                        ],
                      ))),
              SizedBox(height: 0),
              Container(
                width: 400,
                height: 730,

                
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
                          return Center(child: Text('Kosong Bnag'));
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
                                      Container(
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
                                            Container(
                                              child: Padding(
                                                padding: const EdgeInsets.all(10),
                                                child: Column(
                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Text('${user['name']}'),
                                                    Text('Test2')
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                );
                              });
                        }
                      }),
                ),
              
            ]),
          ],
        ));
  }
  
}
