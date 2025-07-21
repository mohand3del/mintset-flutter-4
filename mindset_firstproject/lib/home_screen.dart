import 'package:flutter/material.dart';
import 'package:mindset_firstproject/login_screen.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key,required this.userName});
  final String userName;
  final TextEditingController _controller = TextEditingController();

  @override
  final List<String> items = [
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
    'Item 6',
    'Item 7',
    'Item 8',
    'Item 9',
    'Item 10',
  ];
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title:  Text(
            '$userName',
            style: TextStyle(color: Colors.white),
          ),
          elevation: 2,
          backgroundColor: const Color(0xff6200EE),
          actions: [
            IconButton(
                icon: const Icon(
                  Icons.search,
                  color: Colors.white,
                ),
                onPressed: () {
                  // Action for search button
                }),
          ],
        ),
        body: Column(
          children: [
            GestureDetector(
                onTap: () {},
                onDoubleTap: () {
                  print('Search icon double-tapped!');
                },
                onLongPress: () {
                  print('Search icon long-pressed!');
                },
                child: Icon(Icons.search, size: 50, color: Colors.blue)),
            const SizedBox(height: 20),
            InkWell(
                onTap: () {
                  print('Search icon tapped!');
                },
                onDoubleTap: () {
                  print('Search icon double-tapped!');
                },
                onLongPress: () {
                  print('Search icon long-pressed!');
                },
                child: Icon(Icons.search, size: 50, color: Colors.blue)),
          ],
        ));
  }
}
