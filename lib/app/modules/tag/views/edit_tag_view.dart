import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../data/tag_model.dart';
import '../controllers/tag_controller.dart';

class EditTagView extends StatelessWidget {
  final TagController controller = Get.find();
  final TextEditingController namaTagController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final DataTag tag = Get.arguments;
    namaTagController.text = tag.namaTag!;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Tag',
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
              'Update Tag',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color:  Color.fromARGB(255, 21, 164, 8),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: namaTagController,
              decoration: InputDecoration(
                labelText: 'Nama Tag',
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
                  final updatedTag = DataTag(
                    id: tag.id,
                    namaTag: namaTagController.text,
                  );
                  controller.updateTag(tag.id!, updatedTag);
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