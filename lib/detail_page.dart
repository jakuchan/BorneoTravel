import 'package:flutter/material.dart';

// Kelas DetailPage yang menampilkan detail produk.
class DetailPage extends StatelessWidget {
  final Map<String, dynamic> product; // Produk yang akan ditampilkan detailnya.

  // Konstruktor untuk menerima produk sebagai parameter.
  const DetailPage({Key? key, required this.product}) : super(key: key);

  // Fungsi build untuk membangun tampilan halaman.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Page'), // Judul AppBar.
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0), // Padding untuk seluruh halaman.
        child: Card(
          elevation: 5, // Elevasi card untuk efek bayangan.
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0), // Bentuk border card.
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Menampilkan gambar produk jika tersedia.
              if (product['image'] != null)
                ClipRRect(
                  borderRadius: BorderRadius.circular(15.0), // Membuat border melengkung pada gambar.
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
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10), // Spasi vertikal.
                    Text(
                      product['type'],
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10), // Spasi vertikal.
                    // Teks untuk alamat produk.
                    Text(
                      product['city'],
                      style: const TextStyle(fontSize: 16),
                    ),
                    SizedBox(height: 10), // Spasi vertikal.
                    // Teks untuk deskripsi produk.
                    Text(
                      product['province'],
                      style: const TextStyle(fontSize: 14, color: Color.fromARGB(255, 0, 0, 0)),
                    ),
                    SizedBox(height: 10),
                    Text(
                      product['day'],
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      product['time'],
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10), // Spasi vertikal. // Spasi vertikal. // Spasi vertikal.
                    // Teks untuk harga tiket produk.
                    Text(
                      'Harga Tiket: ${product['price']}',
                      style: const TextStyle(fontSize: 16, color: Colors.green),
                    ),
                    SizedBox(height: 20), // Spasi vertikal.
                    // Tombol untuk memesan tiket.
                    
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
