import 'package:flutter/material.dart';
import 'package:calendar_appbar/calendar_appbar.dart';

class Halamantugas extends StatelessWidget {
  final Map<String, String> tugasData;

  Halamantugas({required this.tugasData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFDBE7C9), // Background color Halaman Mendaftar
      appBar: CalendarAppBar(
        onDateChanged: (value) => print(value),
        firstDate: DateTime.now().subtract(Duration(days: 140)),
        lastDate: DateTime.now(),
        accent: Color(
            0xFF294B29), // optional: customize the color of the CalendarAppBar
        backButton: true, // optional: add a back button
      ),
      body: Center(
        // Menggunakan Center untuk menempatkan Container di tengah
        child: Container(
          width: double.infinity, // Lebar penuh sesuai dengan padding
          margin: const EdgeInsets.all(
              16.0), // Menggunakan margin sebagai pengganti padding untuk menjaga lebar penuh
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: Color(0xFF294B29), // Mengubah warna container dasar
            borderRadius: BorderRadius.circular(8.0),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 6.0,
                offset: Offset(0, 2),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize
                .min, // Membuat Container hanya setinggi konten di dalamnya
            children: [
              Text(
                'Status Tugas: ${tugasData['status']}',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white, // Ubah warna teks menjadi putih
                ),
              ),
              SizedBox(height: 16),
              Container(
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  color: Color(0xFFE0F7FA),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Judul Tugas: ${tugasData['judul']}',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Mata Kuliah: ${tugasData['mataKuliah']}',
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 8),
              Row(
                children: [
                  Icon(
                    Icons.access_time,
                    color: Colors.red,
                    size: 16,
                  ),
                  SizedBox(width: 4),
                  Text(
                    'Tenggat Waktu: ${tugasData['tenggatWaktu']} ${tugasData['jam']}',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
