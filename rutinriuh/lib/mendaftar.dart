// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

class HalamanMendaftar extends StatefulWidget {
  @override
  _HalamanMendaftarState createState() => _HalamanMendaftarState();
}

class _HalamanMendaftarState extends State<HalamanMendaftar> {
  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFDBE7C9), // Background color Halaman Mendaftar
      appBar: AppBar(
        title: Text(
          "Mendaftar",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Color(0xFFDBE7C9),
        centerTitle: true, // Warna app bar
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              decoration: InputDecoration(
                labelText: 'Masukkan email anda',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.email),
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              decoration: InputDecoration(
                labelText: 'Masukkan password anda',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.lock),
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              decoration: InputDecoration(
                labelText: 'Konfirmasi Password anda',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.lock),
              ),
              obscureText: true,
            ),
            SizedBox(height: 16.0),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Checkbox(
                  value: _isChecked,
                  onChanged: (bool? value) {
                    setState(() {
                      _isChecked = value!;
                    });
                  },
                  checkColor: Colors.white, // warna centang
                  activeColor: Colors.black, // warna kotak cek
                ),
                SizedBox(
                  width: 2.0,
                  height: 15,
                ), // Jarak antara checkbox dan teks
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Saya menyetujui syarat dan ketentuan yang berlaku.',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Saya ingin menerima newsletter dan promo.',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 16.0), // Jarak antara checkbox dan tombol
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      Color(0xFF294B29), // Ubah warna tombol di sini
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 15.0),
                ),
                onPressed: () {
                  // Implementasi logika tombol
                  print('Tombol Daftar ditekan');
                },
                child: Text(
                  'Daftar',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
