import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Route Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // STEP 4: Setup Route Named
      // initialRoute menentukan halaman pertama yang ditampilkan
      initialRoute: '/',
      // routes adalah map yang menghubungkan nama route dengan halaman
      routes: {
        '/': (context) => const HomePage(),
        '/increment': (context) => const IncrementPage(),
        '/decrement': (context) => const DecrementPage(),
      },
    );
  }
}

// STEP 1: Halaman Utama (HomePage)
// Halaman ini berisi tombol untuk navigasi ke halaman lain
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Halaman Utama'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Pilih Halaman:',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 40),
            // Tombol untuk pindah ke halaman Increment
            ElevatedButton.icon(
              onPressed: () {
                // Navigator.pushNamed digunakan untuk navigasi dengan route name
                Navigator.pushNamed(context, '/increment');
              },
              icon: const Icon(Icons.add),
              label: const Text('Ke Halaman Increment'),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                  horizontal: 30,
                  vertical: 15,
                ),
              ),
            ),
            const SizedBox(height: 20),
            // Tombol untuk pindah ke halaman Decrement
            ElevatedButton.icon(
              onPressed: () {
                Navigator.pushNamed(context, '/decrement');
              },
              icon: const Icon(Icons.remove),
              label: const Text('Ke Halaman Decrement'),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                  horizontal: 30,
                  vertical: 15,
                ),
              ),
            ),
            const SizedBox(height: 40),
            const Text(
              "IZINN 🫷🏻",
              style: TextStyle(color: Colors.red, fontSize: 50),
            ),
          ],
        ),
      ),
    );
  }
}

// STEP 2: Halaman Increment
// Halaman ini untuk menambah nilai counter
class IncrementPage extends StatefulWidget {
  const IncrementPage({super.key});

  @override
  State<IncrementPage> createState() => _IncrementPageState();
}

class _IncrementPageState extends State<IncrementPage> {
  int _counter = 0;
  Color bgColor = Colors.white;
  // Fungsi random color dipindah ke widget supaya bisa dipanggil
  Color getRandomColor() {
    final random = Random();
    return Color.fromARGB(
      255,
      random.nextInt(256),
      random.nextInt(256),
      random.nextInt(256),
    );
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
      bgColor = getRandomColor();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Halaman Increment'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Nilai Counter:', style: TextStyle(fontSize: 20)),
            const SizedBox(height: 20),
            Text('$_counter', style: Theme.of(context).textTheme.headlineLarge),
            const SizedBox(height: 40),
            // Tombol increment menggunakan FloatingActionButton
            FloatingActionButton.extended(
              onPressed: _incrementCounter,
              icon: const Icon(Icons.add),
              label: const Text('Tambah'),
            ),
          ],
        ),
      ),
    );
  }
}

// STEP 3: Halaman Decrement
// Halaman ini untuk mengurangi nilai counter
class DecrementPage extends StatefulWidget {
  const DecrementPage({super.key});

  @override
  State<DecrementPage> createState() => _DecrementPageState();
}

class _DecrementPageState extends State<DecrementPage> {
  int _counter = 0;
  Color bgColor = Colors.white;

  Color getRandomColor() {
    final random = Random();
    return Color.fromARGB(
      255,
      random.nextInt(256),
      random.nextInt(256),
      random.nextInt(256),
    );
  }

  void _decrementCounter() {
    setState(() {
      _counter--;
      bgColor = getRandomColor();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Halaman Decrement'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Nilai Counter:', style: TextStyle(fontSize: 20)),
            const SizedBox(height: 20),
            Text('$_counter', style: Theme.of(context).textTheme.headlineLarge),
            const SizedBox(height: 40),
            // Tombol decrement menggunakan ElevatedButton
            ElevatedButton.icon(
              onPressed: _decrementCounter,
              icon: const Icon(Icons.remove),
              label: const Text('Kurangi'),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                  horizontal: 40,
                  vertical: 20,
                ),
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
