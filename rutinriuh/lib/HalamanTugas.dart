import 'package:flutter/material.dart';
import 'package:calendar_appbar/calendar_appbar.dart';
import 'package:rutinriuh/edittugas.dart';

class Halamantugas extends StatelessWidget {
  final Map<String, String> tugasData;

  Halamantugas({required this.tugasData});

  void _showDeleteConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          title: Text('Menghapus'),
          content: Text('Apakah anda yakin ingin menghapus?'),
          actions: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop(); // Menutup dialog
                  },
                  child: Text('Batalkan'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFD76969), // Warna tombol Batalkan
                  ),
                ),
                SizedBox(height: 8),
                ElevatedButton(
                  onPressed: () {
                    // Logika untuk menghapus tugas di sini
                    Navigator.of(context)
                        .pop(); // Menutup dialog setelah menghapus
                  },
                  child: Text('Hapus'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black, // Warna tombol Hapus
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }

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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
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
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Color(
                              0xFF789461), // Warna container untuk tombol edit
                          borderRadius: BorderRadius.circular(
                              8.0), // Melengkungkan setiap sudut
                        ),
                        child: IconButton(
                          icon: Icon(Icons.edit, color: Colors.white),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => editPage()),
                            ); // Handle button press
                          },
                        ),
                      ),
                      SizedBox(width: 8), // Jarak antara dua tombol
                      Container(
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Color(
                              0xFFF08585), // Warna container untuk tombol hapus
                          borderRadius: BorderRadius.circular(
                              8.0), // Melengkungkan setiap sudut
                        ),
                        child: IconButton(
                          icon: Icon(Icons.delete, color: Colors.white),
                          onPressed: () {
                            _showDeleteConfirmationDialog(context);
                          },
                        ),
                      ),
                    ],
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
