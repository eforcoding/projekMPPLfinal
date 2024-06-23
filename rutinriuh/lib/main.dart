import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:rutinriuh/halamanPertama.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFDBE7C9),
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'gambar/logo.png', // Ganti dengan path gambar Anda
                    width: 200, // Sesuaikan ukuran gambar sesuai kebutuhan
                    height: 200,
                  ),
                  SizedBox(
                    height: 20,
                  ), // Untuk memberikan sedikit ruang antara gambar dan teks
                  // Tambahkan teks di sini jika diperlukan
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: IconButton(
                icon: Icon(Icons.arrow_forward, size: 30),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HalamanPertama()),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
