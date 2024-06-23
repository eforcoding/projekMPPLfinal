import 'package:flutter/material.dart';
import 'package:rutinriuh/HalamanTugas.dart';
import 'package:rutinriuh/daftar.dart';
import 'package:rutinriuh/tambahTugas.dart';

class HalamanPertama extends StatelessWidget {
  const HalamanPertama({Key? key}) : super(key: key);

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
              );
            },
            icon: Icon(
              Icons.person,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 16), // Jarak antar teks dengan AppBar
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                _buildMenuItem(context, 'Tertunda', 0),
                const SizedBox(width: 10), // Jarak antara teks
                _buildMenuItem(context, 'Berlangsung', 1),
                const SizedBox(width: 10), // Jarak antara teks
                _buildMenuItem(context, 'Selesai', 2),
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
              onPressed: () {},
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

  Widget _buildMenuItem(BuildContext context, String text, int index) {
    return InkWell(
      onTap: () => _onTextTapped(index),
      child: Container(
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: _selectedTextIndex == index
              ? const Color(0xFF50623A)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10.0),
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
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
