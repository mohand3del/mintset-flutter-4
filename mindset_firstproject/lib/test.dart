import 'package:flutter/material.dart';

class BasketballCounter extends StatefulWidget {
  const BasketballCounter({Key? key}) : super(key: key);

  @override
  _BasketballCounterState createState() => _BasketballCounterState();
}

class _BasketballCounterState extends State<BasketballCounter> {
  int teamAScore = 0;
  int teamBScore = 0;

  void addPoints(String team, int points) {
    setState(() {
      if (team == 'A') {
        teamAScore += points;
      } else if (team == 'B') {
        teamBScore += points;
      }
    });
  }

  void resetScores() {
    setState(() {
      teamAScore = 0;
      teamBScore = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Basketball Counter'),
        backgroundColor: Colors.orange,
        centerTitle: true,
      ),
      body: Column(
        children: [
          // Score display section
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // Team A Score Column
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Team A',
                        style: TextStyle(
                          fontSize: 32.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '$teamAScore',
                        style: const TextStyle(
                          fontSize: 80.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () => addPoints('A', 1),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.orange,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                        ),
                        child: const Text('Add 1 Point',
                            style: TextStyle(fontSize: 18)),
                      ),
                      const SizedBox(height: 8),
                      ElevatedButton(
                        onPressed: () => addPoints('A', 2),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.orange,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                        ),
                        child: const Text('Add 2 Points',
                            style: TextStyle(fontSize: 18)),
                      ),
                      const SizedBox(height: 8),
                      ElevatedButton(
                        onPressed: () => addPoints('A', 3),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.orange,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                        ),
                        child: const Text('Add 3 Points',
                            style: TextStyle(fontSize: 18)),
                      ),
                    ],
                  ),
                ),
                // Divider
                Container(
                  height: 300,
                  width: 2,
                  color: Colors.grey,
                ),
                // Team B Score Column
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Team B',
                        style: TextStyle(
                          fontSize: 32.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '$teamBScore',
                        style: const TextStyle(
                          fontSize: 80.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () => addPoints('B', 1),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                        ),
                        child: const Text('Add 1 Point',
                            style: TextStyle(fontSize: 18)),
                      ),
                      const SizedBox(height: 8),
                      ElevatedButton(
                        onPressed: () => addPoints('B', 2),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                        ),
                        child: const Text('Add 2 Points',
                            style: TextStyle(fontSize: 18)),
                      ),
                      const SizedBox(height: 8),
                      ElevatedButton(
                        onPressed: () => addPoints('B', 3),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                        ),
                        child: const Text('Add 3 Points',
                            style: TextStyle(fontSize: 18)),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // Reset button
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: ElevatedButton(
              onPressed: resetScores,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                padding:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
              ),
              child: const Text(
                'Reset',
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
