import 'package:flutter/material.dart';
import 'package:rutinriuh/gantisandi.dart';
import 'package:rutinriuh/mendaftar.dart';

class Mendaftar extends StatelessWidget {
  const Mendaftar({Key? key}) : super(key: key);

  void _navigateToHalamanMendaftar(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => HalamanMendaftar(),
      ),
    );
  }

  void _navigateToGantiPassword(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => HalamanGantiPassword(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFDBE7C9),
      body: Center(
        child: SingleChildScrollView(
          // Tambahkan SingleChildScrollView di sini
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 60.0),
                child: Image.asset(
                  'gambar/logo.png',
                  height: 150,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 40.0, vertical: 10.0),
                child: TextFormField(
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Colors
                              .black), // Ubah warna pinggiran menjadi hitam
                    ),
                    labelText: 'Email',
                    prefixIcon: Icon(Icons.email_rounded),
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 40.0, vertical: 10.0),
                child: TextFormField(
                  obscureText: true,
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Colors
                              .black), // Ubah warna pinggiran menjadi hitam
                    ),
                    labelText: 'Kata sandi',
                    prefixIcon: Icon(Icons.lock),
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 40.0, bottom: 20.0),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: GestureDetector(
                    onTap: () {
                      _navigateToGantiPassword(
                          context); // Navigasi ke halaman ganti password
                    },
                    child: Text(
                      'Lupa kata sandi?',
                      style: TextStyle(
                          color: const Color.fromARGB(255, 0, 0, 0),
                          decoration: TextDecoration.underline,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40.0),
                child: SizedBox(
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
                    },
                    child: Text(
                      'Daftar',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20.0),
              GestureDetector(
                onTap: () {
                  _navigateToHalamanMendaftar(
                      context); // Navigasi ke halaman pendaftaran
                },
                child: RichText(
                  text: TextSpan(
                    text: 'Tidak punya akun? ',
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                    children: <TextSpan>[
                      TextSpan(
                        text: 'Daftar',
                        style: TextStyle(
                            color: const Color.fromARGB(255, 0, 0, 0),
                            decoration: TextDecoration.underline,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//INI HALAMAN DAFTAR CUYYYY//

//INI HALAMAN RESET PASSWORD BANGGG//

class HalamanGantiPassword extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFDBE7C9), // Background color Halaman Mendaftar
      appBar: AppBar(
        title: Text("Lupa Kata Sandi"),
        backgroundColor: Color(0xFFDBE7C9),
        centerTitle: true, // Warna app bar
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: 8.0),
              Text(
                'Buat kata sandi baru anda\n'
                'pada kolom yang telah tersedia',
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 24.0),
              TextField(
                decoration: InputDecoration(
                  labelText: '*********',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.lock),
                ),
              ),
              SizedBox(height: 100.0),
              SizedBox(
                width: double
                    .infinity, // Lebar tombol sesuai dengan lebar kontainer
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => HalamanGantisandi()),
                    ); // Handle button press
                  },
                  child: Text(
                    'Lanjutkan',
                    style: TextStyle(fontSize: 18),
                    // Ukuran font tombol lebih besar
                  ),
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Color(0xFF294B29), // Warna tombol
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12), // Border radius
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
