import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../data/berita_model.dart';

class ShowBeritaView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
// Suggested code may be subject to a license. Learn more: ~LicenseLog:1486497298.
    final DataBerita berita = Get.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Berita',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.deepPurple,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          color: Colors.deepPurple[50],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          elevation: 5,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Judul Berita: ${berita.judulBerita}',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepPurple,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Slug: ${berita.slug}',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.deepPurple[700],
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Foto: ${berita.foto}',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.deepPurple[700],
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Deskripsi: ${berita.deskripsi}',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.deepPurple[700],
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'ID Kategori: ${berita.idKategori}',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.deepPurple[700],
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'ID User: ${berita.idUser}',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.deepPurple[700],
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Created At: ${berita.createdAt}',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.deepPurple[700],
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Updated At: ${berita.updatedAt}',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.deepPurple[700],
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