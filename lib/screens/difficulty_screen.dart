import 'package:flaguru/models/Enum.dart';
import 'package:flaguru/screens/menu_screen.dart';
import 'package:flaguru/widgets/diff_card_expandable.dart';
import 'package:flutter/material.dart';

class DifficultyScreen extends StatefulWidget {
  static String routeName = '/difficulty_screen';

  @override
  _DifficultyScreenState createState() => _DifficultyScreenState();
}

class _DifficultyScreenState extends State<DifficultyScreen> with TickerProviderStateMixin {
  final _controllers = List<AnimationController>(4);

  Animation<double> animation;

  @override
  void initState() {
    for (var i = 0, len = _controllers.length; i < len; i++) {
      _controllers[i] =
          AnimationController(duration: const Duration(milliseconds: 300), vsync: this);
    }
    super.initState();
  }

  @override
  void dispose() {
    for (var controller in _controllers) controller.dispose();
    super.dispose();
  }

  void animate(int index) {
    for (var i = 0, len = _controllers.length; i < len; i++) {
      final ctr = _controllers[i];
      if (i == index) {
        (ctr.value == 1) ? ctr.reverse() : ctr.forward();
      } else
        _controllers[i].reverse();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff019dad),
      body: WillPopScope(
        onWillPop: () async => false,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              buildHeader(context),
              ExpandableDiffCard(_controllers[0], diff: Difficulty.EASY, onTap: () => animate(0)),
              ExpandableDiffCard(_controllers[1], diff: Difficulty.NORMAL, onTap: () => animate(1)),
              ExpandableDiffCard(_controllers[2], diff: Difficulty.HARD, onTap: () => animate(2)),
              ExpandableDiffCard(_controllers[3], diff: Difficulty.EASY, onTap: () => animate(3)),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildHeader(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 25, bottom: 5, left: 15, right: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white, size: 30),
            onPressed: () => Navigator.of(context).pushReplacementNamed(MenuScreen.routeName),
          ),
          Text(
            'Difficulty',
            style: TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold),
          ),
          const SizedBox(width: 40),
        ],
      ),
    );
  }
}
