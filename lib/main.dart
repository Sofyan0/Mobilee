import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // Tema dari aplikasi Flutter
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Aplikasi'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  late TextEditingController _kubusController;
  late TextEditingController _balokPanjangController;
  late TextEditingController _balokLebarController;
  late TextEditingController _balokTinggiController;
  late TextEditingController _tabungJariJariController;
  late TextEditingController _tabungTinggiController;

  @override
  void initState() {
    super.initState();
    _kubusController = TextEditingController();
    _balokPanjangController = TextEditingController();
    _balokLebarController = TextEditingController();
    _balokTinggiController = TextEditingController();
    _tabungJariJariController = TextEditingController();
    _tabungTinggiController = TextEditingController();
  }

  @override
  void dispose() {
    _kubusController.dispose();
    _balokPanjangController.dispose();
    _balokLebarController.dispose();
    _balokTinggiController.dispose();
    _tabungJariJariController.dispose();
    _tabungTinggiController.dispose();
    super.dispose();
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      _counter--;
    });
  }

  // Fungsi untuk menghitung luas kubus
  double _hitungLuasKubus(double sisi) {
    return 6 * sisi * sisi;
  }

  // Fungsi untuk menghitung luas balok
  double _hitungLuasBalok(double panjang, double lebar, double tinggi) {
    return 2 * ((panjang * lebar) + (panjang * tinggi) + (lebar * tinggi));
  }

  // Fungsi untuk menghitung luas tabung
  double _hitungLuasTabung(double jariJari, double tinggi) {
    return 2 * pi * jariJari * (jariJari + tinggi);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Warna latar belakang app bar
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Judul dari app bar, diambil dari objek MyHomePage yang dibuat oleh metode App.build
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Text untuk menampilkan jumlah klik tombol
            const Text(
              'Anda telah menekan tombol sebanyak:',
            ),
            // Text yang menampilkan nilai _counter
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline6,
            ),
            SizedBox(height: 20), // Spasi antara elemen
            // TextField untuk input teks
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                controller: _kubusController,
                decoration: InputDecoration(
                  labelText: 'Sisi Kubus',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            SizedBox(height: 20), // Spasi antara elemen
            // Tombol untuk menghitung luas kubus
            ElevatedButton(
              onPressed: () {
                double sisi = double.parse(_kubusController.text);
                double luas = _hitungLuasKubus(sisi);
                showDialog(
                  context: context,
                  builder: (_) => AlertDialog(
                    title: Text('Luas Kubus'),
                    content: Text('Luas kubus dengan sisi $sisi adalah $luas'),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text('Tutup'),
                      ),
                    ],
                  ),
                );
              },
              child: Text('Hitung Luas Kubus'),
            ),
            SizedBox(height: 20),
            // TextField untuk input teks
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  TextField(
                    controller: _balokPanjangController,
                    decoration: InputDecoration(
                      labelText: 'Panjang Balok',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 10),
                  TextField(
                    controller: _balokLebarController,
                    decoration: InputDecoration(
                      labelText: 'Lebar Balok',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 10),
                  TextField(
                    controller: _balokTinggiController,
                    decoration: InputDecoration(
                      labelText: 'Tinggi Balok',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20), // Spasi antara elemen
            // Tombol untuk menghitung luas balok
            ElevatedButton(
              onPressed: () {
                double panjang = double.parse(_balokPanjangController.text);
                double lebar = double.parse(_balokLebarController.text);
                double tinggi = double.parse(_balokTinggiController.text);
                double luas = _hitungLuasBalok(panjang, lebar, tinggi);
                showDialog(
                  context: context,
                  builder: (_) => AlertDialog(
                    title: Text('Luas Balok'),
                    content: Text('Luas balok dengan panjang $panjang, lebar $lebar, dan tinggi $tinggi adalah $luas'),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text('Tutup'),
                      ),
                    ],
                  ),
                );
              },
              child: Text('Hitung Luas Balok'),
            ),
            SizedBox(height: 20),
            // TextField untuk input teks
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  TextField(
                    controller: _tabungJariJariController,
                    decoration: InputDecoration(
                      labelText: 'Jari-Jari Tabung',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 10),
                  TextField(
                    controller: _tabungTinggiController,
                    decoration: InputDecoration(
                      labelText: 'Tinggi Tabung',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20), // Spasi antara elemen
            // Tombol untuk menghitung luas tabung
            ElevatedButton(
              onPressed: () {
                double jariJari = double.parse(_tabungJariJariController.text);
                double tinggi = double.parse(_tabungTinggiController.text);
                double luas = _hitungLuasTabung(jariJari, tinggi);
                showDialog(
                  context: context,
                  builder: (_) => AlertDialog(
                    title: Text('Luas Tabung'),
                    content: Text('Luas tabung dengan jari-jari $jariJari dan tinggi $tinggi adalah $luas'),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text('Tutup'),
                      ),
                    ],
                  ),
                );
              },
              child: Text('Hitung Luas Tabung'),
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          // Tombol untuk mengurangi nilai _counter
          FloatingActionButton(
            onPressed: _decrementCounter,
            tooltip: 'Kurangi',
            child: const Icon(Icons.remove),
          ),
          SizedBox(width: 16), // Spasi antara tombol
          // Tombol untuk menambah nilai _counter
          FloatingActionButton(
            onPressed: _incrementCounter,
            tooltip: 'Tambah',
            child: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
