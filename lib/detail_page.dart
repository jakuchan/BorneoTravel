import 'package:flutter/material.dart';
import 'package:url_launcher/link.dart';

// Kelas DetailPage yang menampilkan detail produk.
class DetailPage extends StatelessWidget {
  final Map<String, dynamic> product; // Produk yang akan ditampilkan detailnya.

  // Konstruktor untuk menerima produk sebagai parameter.
  const DetailPage({Key? key, required this.product}) : super(key: key);

  // Fungsi build untuk membangun tampilan halaman.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
              automaticallyImplyLeading: false,
              backgroundColor: const Color.fromARGB(255, 0, 97, 187),
              leading: BackButton( color: Colors.white,),
              title: Text('Rincian ' + product['type'], style: TextStyle(color: Colors.white),),
        ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Menampilkan gambar produk jika tersedia.
              if (product['image'] != null)
                Container(
                  child: Image.network(
                    '${product['image']}',
                    width: double.infinity,
                    fit: BoxFit.cover, // Mengatur gambar agar sesuai dengan lebar container.
                  ),
                )
              else
                Container(
                  height: 0, // Jika tidak ada gambar, atur tinggi menjadi 0.
                ),
              Padding(
                padding: const EdgeInsets.all(20.0), // Padding dalam card.
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Teks untuk nama produk.
                    Text(
                      product['name'],
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    
                    SizedBox(height: 10), // Spasi vertikal.
                    // Teks untuk alamat produk.
                    Container(
                      child: Row(
                        children: [
                    Text(
                      product['city'],
                      style: const TextStyle(fontSize: 16),
                    ),
                    Text(', '),
                    SizedBox(height: 10), // Spasi vertikal.
                    // Teks untuk deskripsi produk.
                    Text(
                      product['province'],
                      style: const TextStyle(fontSize: 16, color: Color.fromARGB(255, 0, 0, 0)),
                    ),
                        ]
                      )

                    ),
                    SizedBox(height: 10),
                    Text('Buka:'),

                    Text(
                      product['day'],
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text('Jam Operasional:'),
                    Text(
                      product['time'],
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10), // Spasi vertikal. // Spasi vertikal. // Spasi vertikal.
                    // Teks untuk harga tiket produk.
                    Text('Harga Tiket:'),
                    Text(
                      'Rp${product['price']}',
                      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold,  color: Colors.black, ),
                    ),
                    SizedBox(height: 10), // Spasi vertikal. // Spasi vertikal. // Spasi vertikal.

                    Link(uri: Uri.parse(product ['maps']), builder: (context, followLink){
                      return TextButton(style: TextButton.styleFrom(padding: EdgeInsets.zero,),onPressed: followLink, child: Text('Google Maps', style: TextStyle(fontSize: 18, decoration: TextDecoration.underline, decorationColor: Colors.blue, color: Colors.blue),));
                    }), // Spasi vertikal.
                    // Tombol untuk memesan tiket.
                    RichText(text: TextSpan(
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: product['description']
                        )
                      ]
                    ),
                    textAlign: TextAlign.justify,)
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
