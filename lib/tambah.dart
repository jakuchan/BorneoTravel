// ignore_for_file: use_build_context_synchronously

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:url_launcher/link.dart';
import 'dbhelper.dart';
import 'package:url_launcher/url_launcher.dart';

class MyFormPage extends StatefulWidget {
  const MyFormPage({Key? key}) : super(key: key);

  @override

// ignore: library_private_types_in_public_api
  _MyFormPageState createState() => _MyFormPageState();
}

class _MyFormPageState extends State<MyFormPage> {
  final DBHelper dbHelper = DBHelper();
  final _formKey = GlobalKey<FormState>();
  final _imageController = TextEditingController();
  final _nameController = TextEditingController();
  final _typeController = TextEditingController();
  final _cityController = TextEditingController();
  final _provinceController = TextEditingController();
  final _dayController = TextEditingController();
  final _timeController = TextEditingController();
  final _priceController = TextEditingController();
  final _mapsController = TextEditingController();
  final _descriptionController = TextEditingController();
  List<Map<String, dynamic>> _users = [];

  @override
  void initState() {
    super.initState();
    _refreshUsers();
  }

  void _refreshUsers() async {
    final data = await dbHelper.queryAllUsers();
    setState(() {
      _users = data;
    });
  }

  void _showForm(int? id) {
    if (id != null) {
      final existingUser = _users.firstWhere((element) => element['id'] == id);
      _imageController.text = existingUser['image'];
      _nameController.text = existingUser['name'];
      _typeController.text = existingUser['type'];
      _cityController.text = existingUser['city'];
      _provinceController.text = existingUser['province'];
      _dayController.text = existingUser['day'];
      _timeController.text = existingUser['time'];
      _priceController.text = existingUser['price'];
      _mapsController.text = existingUser['maps'];
      _descriptionController.text = existingUser['description'];
    } else {
      _imageController.clear();
      _nameController.clear();
      _typeController.clear();
      _cityController.clear();
      _provinceController.clear();
      _dayController.clear();
      _timeController.clear();
      _priceController.clear();
      _mapsController.clear();
      _descriptionController.clear();
    }

    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        elevation: 0,
        builder: (_) => Padding(
              padding: const EdgeInsets.all(20),
              child: Container(
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextFormField(
                        controller: _imageController,
                        decoration:
                            const InputDecoration(labelText: 'Link Gambar'),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter a name';
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                        controller: _nameController,
                        decoration:
                            const InputDecoration(labelText: 'Nama Tempat'),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter a name';
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                        controller: _typeController,
                        decoration:
                            const InputDecoration(labelText: 'Wisata, Hotel'),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter a type';
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                        controller: _cityController,
                        decoration: const InputDecoration(labelText: 'Kota'),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter a class';
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                        controller: _provinceController,
                        decoration:
                            const InputDecoration(labelText: 'Provinsi'),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter a valid province';
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                        controller: _dayController,
                        decoration:
                            const InputDecoration(labelText: 'Hari Buka/Tutup'),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter a valid day';
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                        controller: _timeController,
                        decoration:
                            const InputDecoration(labelText: 'Jam Buka/Tutup'),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter a class';
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                        controller: _priceController,
                        decoration:
                            const InputDecoration(labelText: 'Harga Tiket'),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter a valid phone number';
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                        controller: _mapsController,
                        decoration:
                            const InputDecoration(labelText: 'Google Maps URL'),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter a valid location';
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                        controller: _descriptionController,
                        decoration:
                            const InputDecoration(labelText: 'Deskripsi'),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter an address';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 10),
                      ElevatedButton(
                        child: Text(id == null ? 'Create' : 'Update'),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            if (id == null) {
                              _addUser();
                            } else {
                              _updateUser(id);
                            }
                            Navigator.of(context).pop();
                          }
                        },
                      )
                    ],
                  ),
                ),
              ),
            ));
  }

  Future<void> _addUser() async {
    await dbHelper.insertUser({
      'image': _imageController.text,
      'name': _nameController.text,
      'type': _typeController.text,
      'city': _cityController.text,
      'province': _provinceController.text,
      'day': _dayController.text,
      'time': _timeController.text,
      'price': _priceController.text,
      'maps': _mapsController.text,
      'description': _descriptionController.text,
    });
    _refreshUsers();
  }

  Future<void> _updateUser(int id) async {
    await dbHelper.updateUser({
      'id': id,
      'image': _imageController.text,
      'name': _nameController.text,
      'type': _typeController.text,
      'city': _cityController.text,
      'province': _provinceController.text,
      'day': _dayController.text,
      'time': _timeController.text,
      'price': _priceController.text,
      'maps': _mapsController.text,
      'description': _descriptionController.text,
    });
    _refreshUsers();
  }

  void _deleteUser(int id) async {
    await dbHelper.deleteUser(id);
    ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(content: Text('User deleted')));
    _refreshUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 202, 202, 202),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Color.fromARGB(255, 0, 97, 187),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            BackButton(
              color: Colors.white,
            ),
            Text(
              'Tambahkan Data Wisata',
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
            IconButton(
                onPressed: () => _showForm(null),
                icon: Icon(
                  Icons.add,
                  color: Colors.white,
                )),
          ],
        ),
      ),
      body: ListView.builder(
        itemCount: _users.length,
        itemBuilder: (context, index) => Card(
          margin: const EdgeInsets.all(25),
          child: Container(
            width: 80,
            decoration: BoxDecoration(
                color: Colors.blueGrey,
                borderRadius: BorderRadius.circular(10)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(vertical: 10),
                            width: 320,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                
                                Container(
                            
                                  width: 50,
                                  height: 50,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                    image: NetworkImage(_users[index]['image']),
                                    fit: BoxFit.cover,
                                  )),
                                ),
                            Container(
                                child: Row(children: [
                              IconButton(
                                icon: const Icon(
                                  Icons.edit,
                                  color: Colors.white,
                                ),
                                onPressed: () => _showForm(_users[index]['id']),
                              ),
                              IconButton(
                                icon:
                                    const Icon(Icons.delete, color: Colors.white),
                                onPressed: () {
                                  showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          title: Text('Menghapus Data Wisata'),
                                          content: Text(
                                              'Apakah anda yakin ingin menghapus data wisata' +
                                                  _users[index]['name'] +
                                                  '?'),
                                          actions: <Widget>[
                                            TextButton(
                                              onPressed: () => Navigator.pop(
                                                context,
                                              ),
                                              child: Text('Batal'),
                                            ),
                                            TextButton(
                                              onPressed: () async {
                                                await DBHelper().deleteUser(
                                                    _users[index]['id']);
                                                _refreshUsers();
                                                Navigator.pop(context);
                                              },
                                              child: Text('Hapus'),
                                            )
                                          ],
                                        );
                                      });
                                },
                              ),
                            ])),
                              ],
                            ),
                          ),
                          Container(
                              child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                'Nama: ' + _users[index]['name'],
                                style: TextStyle(color: Colors.white),
                              ),
                              Text(
                                'Tipe: ' + _users[index]['type'],
                                style: TextStyle(color: Colors.white),
                              ),
                              Text('Kota: ' + _users[index]['city'],
                                  style: TextStyle(color: Colors.white)),
                              Text('Provinsi: ' + _users[index]['province'],
                                  style: TextStyle(color: Colors.white)),
                              Text('Hari Buka/Tutup: ' + _users[index]['day'],
                                  style: TextStyle(color: Colors.white)),
                              Text('Jam Buka/Tutup: ' + _users[index]['time'],
                                  style: TextStyle(color: Colors.white)),
                              Text('Harga Tiket: ' + _users[index]['price'],
                                  style: TextStyle(color: Colors.white)),
                              Link(uri: Uri.parse(_users[index]['maps']), builder: (context, followLink) {
                                  return TextButton(style: TextButton.styleFrom(padding: EdgeInsets.zero,),onPressed:followLink ,  child: Container(width: 300, child: AutoSizeText(_users[index]['maps'], style: TextStyle(color: Colors.blue, ), minFontSize: 5, overflow: TextOverflow.ellipsis,)));
                              }),
                              Container(
                                  margin: EdgeInsets.only(top: 20),
                                  child: Text('Deskripsi:',
                                      style: TextStyle(color: Colors.white))),
                              Container(
                                  width: 290,
                                  child: Text(_users[index]['description'],
                                      style: TextStyle(color: Colors.white))),
                            ],
                          ))
                        ]),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
