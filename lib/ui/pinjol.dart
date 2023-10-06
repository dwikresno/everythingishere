import 'package:flutter/material.dart';

class Pinjol extends StatefulWidget {
  const Pinjol({super.key});

  @override
  State<Pinjol> createState() => _PinjolState();
}

class _PinjolState extends State<Pinjol> {
  double size = 0.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.sizeOf(context).width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedDefaultTextStyle(
              duration: Duration(milliseconds: 1000),
              style: TextStyle(fontSize: size),
              child: Text(
                'Pinjam\nDulu\n100',
                style: TextStyle(
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  size = 100;
                });
              },
              child: Text("Pinjam"),
            ),
          ],
        ),
      ),
    );
  }
}
