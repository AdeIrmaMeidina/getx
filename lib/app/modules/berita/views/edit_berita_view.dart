import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../data/berita_model.dart';
import '../controllers/berita_controller.dart';

class EditBeritaView extends StatelessWidget {
  final BeritaController controller = Get.find();
  final TextEditingController judulBeritaController = TextEditingController();
// Suggested code may be subject to a license. Learn more: ~LicenseLog:3281429705.
  final TextEditingController slugController = TextEditingController();
  final TextEditingController fotoController = TextEditingController();
  final TextEditingController deskripsiController = TextEditingController();
  final TextEditingController idKategoriController = TextEditingController();
  final TextEditingController idUserController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final DataBerita berita = Get.arguments;
    judulBeritaController.text = berita.judulBerita!;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Berita',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        elevation: 0,
        backgroundColor:  Color.fromARGB(255, 21, 164, 8),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Update Berita',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color:  Color.fromARGB(255, 21, 164, 8),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: judulBeritaController,
              decoration: InputDecoration(
                labelText: 'Nama Berita',
                labelStyle: TextStyle(color:  Color.fromARGB(255, 21, 164, 8),),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(color: Color.fromARGB(255, 21, 164, 8),),
                ),
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  final updatedBerita = DataBerita(
                    id: berita.id,
                    judulBerita: judulBeritaController.text,
                    slug: slugController.text,
                    foto: fotoController.text,
                    deskripsi: deskripsiController.text,
                    idKategori: int.parse(idKategoriController.text),
                    idUser: int.parse(idUserController.text),
                  );
                  controller.updateBerita(berita.id!, updatedBerita);
                  Get.back();
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                  backgroundColor:  Color.fromARGB(255, 21, 164, 8),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                child: Text(
                  'Update',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}