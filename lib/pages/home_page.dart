import 'package:flutter/material.dart';
import 'package:triviaa/pages/game_page.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  double? _deviceHeight, _deviceWidth;
  double _currentDifficultyLevel = 0;
  final List<String> _difficultyLevels = ["Easy", "Medium", "Hard"];
  @override
  Widget build(BuildContext context) {
    _deviceHeight = MediaQuery.of(context).size.height;
    _deviceWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: SafeArea(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: _deviceWidth! * 0.10),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _appTitle(),
                  _difficultySlider(),
                  _startGameButton(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _appTitle() {
    return Column(
      children: [
        const Text(
          'Frivia',
          style: TextStyle(
              color: Colors.white, fontSize: 50, fontWeight: FontWeight.w500),
        ),
        Text(
          _difficultyLevels[_currentDifficultyLevel.toInt()],
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w200,
          ),
        ),
      ],
    );
  }

  Widget _difficultySlider() {
    return Slider(
        label: 'Difficulty',
        min: 0,
        max: 2,
        divisions: 2,
        value: _currentDifficultyLevel,
        onChanged: (_value) {
          setState(() {
            _currentDifficultyLevel = _value;
          });
        });
  }

  Widget _startGameButton() {
    return MaterialButton(
        color: Colors.blue,
        minWidth: _deviceWidth! * 0.80,
        height: _deviceHeight! * 0.10,
        child: const Text(
          "Start",
          style: TextStyle(
            color: Colors.white,
            fontSize: 25,
          ),
        ),
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (BuildContext _context) {
            return GamePage(
              difficultyLevel:
                  _difficultyLevels[_currentDifficultyLevel.toInt()]
                      .toLowerCase(),
            );
          }));
        });
  }
}
