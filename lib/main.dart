import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: HomePage());
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int count = 0;

  void decrement() {
    setState(() {
      count--;
    });
    print(count);
  }

  void increment() {
    setState(() {
      count++;
    });
    print(count);
  }

  bool get isEmpty => count == 0;

  bool get isFull => count == 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/streat.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  width: 350,
                  height: 120,
                  child: Image.asset('assets/images/flag.png'),
                ),
                Text(
                  isFull ? 'Full' : 'Access!',
                  style: const TextStyle(fontSize: 48, color: Colors.black),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(40),
              child: Text(
                '$count',
                style: TextStyle(
                  fontSize: 100,
                  color: isFull ? Colors.red : Colors.white,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: isEmpty ? null : decrement,
                  style: TextButton.styleFrom(
                    backgroundColor:
                        isEmpty ? Colors.white.withOpacity(0.2) : Colors.white,
                    fixedSize: const Size(100, 100),
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: const Text(
                    'Exit',
                    style: TextStyle(color: Colors.black, fontSize: 30),
                  ),
                ),
                const SizedBox(width: 30),
                TextButton(
                  onPressed: isFull ? null : increment,
                  style: TextButton.styleFrom(
                    backgroundColor:
                        isFull ? Colors.white.withOpacity(0.2) : Colors.white,
                    fixedSize: const Size(100, 100),
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: const Text(
                    'Enter',
                    style: TextStyle(color: Colors.black, fontSize: 30),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
