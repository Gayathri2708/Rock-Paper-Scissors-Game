import 'package:flutter/material.dart';
import 'package:rock_paper_scissors_game/strings.dart';

enum Move { rock, paper, scissors }

class RPSGameController extends StatefulWidget {
  const RPSGameController({super.key});

  @override
  State<RPSGameController> createState() => _RPSGameControllerState();
}

class _RPSGameControllerState extends State<RPSGameController> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          title: const Center(
              child: Text(
            Strings.title,
            style: TextStyle(color: Colors.white),
          )),
          backgroundColor: Colors.blue),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              Strings.selectYourChoice,
              style: TextStyle(fontSize: 18, color: Colors.black),
            ),
          ),
          Row(
            children: [
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(50.0),
                child: Container(
                    // decoration: BoxDecoration(
                    // borderRadius: BorderRadius.circular(20.0),
                    //   shape: BoxShape.circle,
                    //   color: Colors.black,
                    // ),
                    height: 100,
                    width: 100,
                    child: Image.asset('assets/images/paper.png')),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                    height: 110,
                    width: 110,
                    child: Image.asset('assets/images/rock.png')),
              ),
            ],
          ),
          SizedBox(height: 20),
          Container(
              height: 110,
              width: 110,
              child: Image.asset('assets/images/scissors.png')),
          SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                color: Colors.green,
                child: Text(
                  Strings.youWin,
                  style: TextStyle(fontSize: 30, color: Colors.white),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
