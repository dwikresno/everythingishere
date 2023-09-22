import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(SlotGameApp());
}

class SlotGameApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Slot Game',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SlotGamePage(),
    );
  }
}

class SlotGamePage extends StatefulWidget {
  @override
  _SlotGamePageState createState() => _SlotGamePageState();
}

class _SlotGamePageState extends State<SlotGamePage> {
  final List<String> symbols = ['A', 'B', 'C', 'D', 'E'];
  final int numOfReels = 3;
  final int numOfVisibleSymbols = 3;
  final double reelHeight = 100.0;
  final Duration spinDuration = Duration(milliseconds: 400);

  Random random = Random();
  bool isSpinning = false;
  List<String> currentSymbols = [];

  double winPercentage = 0.5; // Default win percentage

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Slot Game'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text('Win Percentage:'),
                Slider(
                  value: winPercentage,
                  onChanged: (value) {
                    setState(() {
                      winPercentage = value;
                    });
                  },
                  min: 0.1,
                  max: 1.0,
                  divisions: 9,
                  label: winPercentage.toStringAsFixed(1),
                ),
              ],
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: isSpinning ? null : startSpin,
              child: Text('Spin'),
            ),
            SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                for (int i = 0; i < numOfReels; i++)
                  Container(
                    height: reelHeight,
                    child: AnimatedAlign(
                      duration: spinDuration,
                      alignment: Alignment(0.0, isSpinning ? 1.0 : 0.0),
                      child: Text(
                        currentSymbols.length > i ? currentSymbols[i] : '',
                        style: TextStyle(fontSize: 40.0),
                      ),
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void startSpin() {
    if (isSpinning) return;

    setState(() {
      isSpinning = true;
    });

    List<String> newSymbols = [];
    if (winPercentage == 1.0) {
      // Generate the same symbols for all reels when win percentage is 100%
      String symbol = getRandomSymbol();
      for (int i = 0; i < numOfReels; i++) {
        newSymbols.add(symbol);
      }
    } else {
      // Generate random symbols for each reel with win percentage probability
      for (int i = 0; i < numOfReels; i++) {
        if (random.nextDouble() <= winPercentage) {
          String symbol = getRandomSymbol();
          newSymbols.add(symbol);
        } else {
          newSymbols.add(currentSymbols[i]);
        }
      }
    }

    Future.delayed(spinDuration, () {
      setState(() {
        isSpinning = false;
        currentSymbols = List.from(newSymbols);
        checkWin();
      });
    });
  }

  String getRandomSymbol() {
    int randomIndex = random.nextInt(symbols.length);
    return symbols[randomIndex];
  }

  void checkWin() {
    if (currentSymbols.toSet().length == 1) {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Congratulations!'),
            content: Text('You won!'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }
}
