import 'package:flutter/material.dart';

class editPage extends StatelessWidget {
  final TextEditingController statusController = TextEditingController();
  final TextEditingController judulController = TextEditingController();
  final TextEditingController mataKuliahController = TextEditingController();
  final TextEditingController tanggalController = TextEditingController();
  final TextEditingController jamController = TextEditingController();

  editPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFDBE7C9),
        title: const Text("Edit Tugas", textAlign: TextAlign.center),
        centerTitle: true,
      ),
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
          color: Color(0xFFADBC9F),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
        ),
        padding: const EdgeInsets.all(40.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              _buildTextField('Status Tugas', statusController),
              _buildTextField('Judul', judulController),
              _buildTextField('Mata kuliah', mataKuliahController),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Text(
                  "Tenggat Waktu",
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              _buildTextField('Tanggal/Bulan/Tahun', tanggalController),
              _buildTextField('Jam', jamController),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context, {
                      'status': statusController.text,
                      'judul': judulController.text,
                      'mataKuliah': mataKuliahController.text,
                      'tenggatWaktu': tanggalController.text,
                      'jam': jamController.text,
                    });
                  },
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Color(0xFF294B29)),
                    minimumSize:
                        MaterialStateProperty.all(Size(double.infinity, 40)),
                  ),
                  child: Text(
                    'Ubah ',
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String hint, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        controller: controller,
        style: TextStyle(color: Colors.black),
        decoration: InputDecoration(
          hintText: hint,
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
            borderSide: BorderSide(color: Colors.black),
          ),
        ),
      ),
    );
  }
}
