import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'โปรแกรมการสุ่มทีมบาส',
        theme: ThemeData(
            // This is the theme of your application.
            //
            // Try running your application with "flutter run". You'll see the
            // application has a blue toolbar. Then, without quitting the app, try
            // changing the primarySwatch below to Colors.green and then invoke
            // "hot reload" (press "r" in the console where you ran "flutter run",
            // or simply save your changes to "hot reload" in a Flutter IDE).
            // Notice that the counter didn't reset back to zero; the application
            // is not restarted.
            primarySwatch: Colors.deepOrange,
            primaryColor: Colors.deepOrange),
        home: const RandomGenerate(),
        darkTheme: ThemeData.from(
            colorScheme: ColorScheme.fromSwatch(
                primarySwatch: Colors.deepOrange,
                backgroundColor: Colors.black87,
                cardColor: Colors.white)));
  }
}

class RandomGenerate extends StatefulWidget {
  const RandomGenerate({super.key});

  @override
  State<RandomGenerate> createState() => _RandomGenerateState();
}

class _RandomGenerateState extends State<RandomGenerate> {
  final _textcontroller = TextEditingController();
  List<String> player = [];
  String user = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text('โปรแกรมการสุ่มทีมบาส')),
      body: Container(
        child:
            Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
              Expanded(child: Container(
                child: Center(
                  child: Text(user,style: TextStyle(color: Colors.white,
                      fontSize: 50,fontWeight: FontWeight.bold)),
                ),
              )),
          TextField(
            controller: _textcontroller,
            decoration: InputDecoration(
                labelText: 'ชื่อเล่นนักบาส', border: OutlineInputBorder(),
                enabledBorder: inputBorder()),
            style:
                TextStyle(color: Colors.white70),
          ),
          MaterialButton(onPressed: () {
            user = addPlayer();
          },color: Colors.deepOrange,
          child: const Text('เพิมนักบาส',style: TextStyle(color: Colors.black87))),
          Text(
            player.toString(),
            style: TextStyle(
                color: Colors.white70,
                fontSize: 30,
                fontWeight: FontWeight.bold),
          )
        ]),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            player = randomPlayer(3);
          });
        },
        child: Text('สุ่มทีม'),
        backgroundColor: Colors.deepOrange,
        foregroundColor: Colors.black87,
      ),
    );
  }
  addPlayer() {
    player.add(_textcontroller.text);
  }

  randomPlayer(int length) {
    List<String> randomPlayer = [];
    Random random = new Random();
    for (String i in player) {
      int value = random.nextInt(player.length);
      randomPlayer.add(player[value]);
      player.remove(player[value]);
    }
    return randomPlayer;
  }

  OutlineInputBorder inputBorder() {
    return OutlineInputBorder(
        borderSide: BorderSide(color: Colors.white)
    );
  }
}