import 'package:flutter/material.dart';
import 'package:rutinriuh/HalamanTugas.dart';
import 'package:rutinriuh/daftar.dart';
import 'package:rutinriuh/tambahTugas.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
      onGenerateRoute: (settings) {
        if (settings.name == '/tugas') {
          final args = settings.arguments as Map<String, String>;
          return MaterialPageRoute(
            builder: (context) {
              return Halamantugas(tugasData: args);
            },
          );
        }
        return null;
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  int _selectedTextIndex = -1; // -1 berarti tidak ada yang dipilih
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onTextTapped(int index) {
    setState(() {
      _selectedTextIndex = index;
      _pageController.animateToPage(
        index,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFDBE7C9),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'Tujuan Tugas',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
            fontSize: 25,
          ),
        ),
        centerTitle: false,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Mendaftar()),
              ); // Tambahkan logika untuk ikon di sini
            },
            icon: Icon(
              Icons.person, // Ganti dengan ikon yang Anda inginkan
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(),
          const SizedBox(height: 16), // Jarak antar teks dengan AppBar
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                InkWell(
                  onTap: () => _onTextTapped(0),
                  child: Container(
                    padding: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      color: _selectedTextIndex == 0
                          ? const Color(0xFF50623A)
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(
                          10.0), // Ubah nilai sesuai keinginan Anda
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(
                          10.0), // Sama dengan nilai sebelumnya
                      child: const Text(
                        'Tertunda',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),

                const SizedBox(width: 10), // Jarak antara teks
                InkWell(
                  onTap: () => _onTextTapped(1),
                  child: Container(
                    padding: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      color: _selectedTextIndex == 1
                          ? const Color(0xFF50623A)
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(
                          10.0), // Ubah nilai sesuai keinginan Anda
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(
                          10.0), // Sama dengan nilai sebelumnya
                      child: const Text(
                        'Berlangsung',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),

                const SizedBox(width: 10), // Jarak antara teks
                InkWell(
                  onTap: () => _onTextTapped(2),
                  child: Container(
                    padding: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      color: _selectedTextIndex == 2
                          ? const Color(0xFF50623A)
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(
                          7.0), // Ubah nilai sesuai keinginan Anda
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(
                          7.0), // Sama dengan nilai sebelumnya
                      child: const Text(
                        'Selesai',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: PageView(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  _selectedTextIndex = index;
                });
              },
              children: [
                TertundaPage(),
                BerlangsungPage(),
                SelesaiPage(),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        items: [
          BottomNavigationBarItem(
            icon: IconButton(
              icon: Icon(Icons.home_outlined, color: Colors.black),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyHomePage()),
                );
              },
            ),
            label: 'Beranda',
          ),
          BottomNavigationBarItem(
            icon: IconButton(
              icon: Icon(Icons.add_circle_sharp, color: Colors.black),
              onPressed: () async {
                final result = await Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TambahPage()),
                );
                if (result != null) {
                  Navigator.pushNamed(context, '/tugas', arguments: result);
                }
              },
            ),
            label: 'Tambah',
          ),
          BottomNavigationBarItem(
            icon: IconButton(
              icon: Icon(Icons.assignment_turned_in, color: Colors.black),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Halamantugas(tugasData: {})),
                );
              },
            ),
            label: 'Tugas',
          ),
        ],
      ),
    );
  }
}

class TertundaPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Tertunda',
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class BerlangsungPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Berlangsung',
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class SelesaiPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Selesai',
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
