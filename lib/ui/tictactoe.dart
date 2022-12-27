import 'package:flutter/material.dart';

class TicTacToe extends StatefulWidget {
  const TicTacToe({super.key});

  @override
  State<TicTacToe> createState() => _TicTacToeState();
}

class _TicTacToeState extends State<TicTacToe> {
  List<List<String>>? _board;
  String? _currentPlayer;
  int x = 0;
  int o = 0;

  @override
  void initState() {
    reset();
    super.initState();
  }

  reset() {
    setState(() {
      _board = [
        ['', '', ''],
        ['', '', ''],
        ['', '', ''],
      ];
      _currentPlayer = 'X';
    });
  }

  bool isDraw() {
    int emptySpaces = 0;
    for (int i = 0; i < _board!.length; i++) {
      for (int j = 0; j < _board![i].length; j++) {
        if (_board![i][j] == "") {
          emptySpaces++;
        }
      }
    }
    return emptySpaces == 0;
  }

  void _playMove(int row, int col) {
    setState(() {
      if (_board![row][col] == '') {
        if (!_checkForWinner()) {
          _board![row][col] = _currentPlayer!;
          _currentPlayer = (_currentPlayer == 'X') ? 'O' : 'X';
          if (_checkForWinner() || isDraw()) {
            // Show a dialog box indicating the winner
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text(isDraw() ? "draw" : 'Winner'),
                  content: Text(isDraw()
                      ? "draw"
                      : 'Player ${(_currentPlayer == 'X') ? 'O' : 'X'} has won the game!'),
                  actions: <Widget>[
                    ElevatedButton(
                      child: Text('Reset'),
                      onPressed: () {
                        setState(() {
                          if (!isDraw()) {
                            if (_currentPlayer != 'X') {
                              x++;
                            } else {
                              o++;
                            }
                          }
                        });
                        reset();
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                );
              },
            );
          }
        }
      }
    });
  }

  bool _checkForWinner() {
    // Check rows
    for (int i = 0; i < 3; i++) {
      if (_board![i][0] != '' &&
          _board![i][0] == _board![i][1] &&
          _board![i][1] == _board![i][2]) {
        return true;
      }
    }

    // Check columns
    for (int i = 0; i < 3; i++) {
      if (_board![0][i] != '' &&
          _board![0][i] == _board![1][i] &&
          _board![1][i] == _board![2][i]) {
        return true;
      }
    }

    // Check diagonals
    if (_board![0][0] != '' &&
        _board![0][0] == _board![1][1] &&
        _board![1][1] == _board![2][2]) {
      return true;
    }
    if (_board![0][2] != '' &&
        _board![0][2] == _board![1][1] &&
        _board![1][1] == _board![2][0]) {
      return true;
    }

    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: Row(
                children: [
                  Center(
                    child: Row(
                      children: [
                        Text(
                          "Score",
                          style: TextStyle(fontSize: 30),
                        ),
                        Text(
                          " X ",
                          style: TextStyle(
                            fontSize: 30,
                            color: Colors.blue,
                          ),
                        ),
                        Text(
                          ": $x",
                          style: TextStyle(fontSize: 30),
                        ),
                      ],
                    ),
                  ),
                  Spacer(),
                  Center(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Score",
                          style: TextStyle(fontSize: 30),
                        ),
                        Text(
                          " O ",
                          style: TextStyle(
                            fontSize: 30,
                            color: Colors.redAccent,
                          ),
                        ),
                        Text(
                          ": $o",
                          style: TextStyle(fontSize: 30),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Container(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Next Turn : ",
                    style: TextStyle(fontSize: 40),
                  ),
                  Text(
                    "$_currentPlayer",
                    style: TextStyle(
                      fontSize: 40,
                      color: _currentPlayer == "X"
                          ? Colors.blue
                          : Colors.redAccent,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  width: 2,
                  color: Colors.blueGrey,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(3, (indexColumn) {
                  return Container(
                    height: 100,
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      children: List.generate(3, (indexRow) {
                        return Expanded(
                          child: GestureDetector(
                            onTap: () => _playMove(indexRow, indexColumn),
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                  width: 2,
                                  color: Colors.blueGrey,
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  _board![indexRow][indexColumn],
                                  style: TextStyle(
                                    fontSize: 72,
                                    color: _board![indexRow][indexColumn] == "X"
                                        ? Colors.blue
                                        : Colors.redAccent,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      }),
                    ),
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
