import 'package:flaguru/models/Authenticator.dart';
import 'package:flaguru/models/User.dart';
import 'package:flaguru/models/LocalStorage.dart';
import 'package:flaguru/models/RoundDetails.dart';
import 'package:flaguru/models/Enum.dart';
import 'dart:convert';

class UserDetail {
  User user;
  RoundDetails easyRound;
  RoundDetails normalRound;
  RoundDetails hardRound;
  RoundDetails endlessRound;
  String totalScore;

  // UserDetail() {
  //   getData();
  // }

  String getData() async {
    var auth = new Authentication();
    user = await auth.getCurrentUser();
    easyRound = await LocalStorage.getLocalResult(Difficulty.EASY);
    normalRound = await LocalStorage.getLocalResult(Difficulty.NORMAL);
    hardRound = await LocalStorage.getLocalResult(Difficulty.HARD);
    endlessRound = await LocalStorage.getLocalResult(Difficulty.ENDLESS);
    totalScore = await LocalStorage().getTotalScore();
    return jsonEncode({
      'uid': user.uuid,
      'name': user.name,
      'email': user.email,
      'photoURL': user.avatar,
      'easyPlayed': easyRound.playedCount,
      'easyWin': easyRound.winningCount,
      'easyScore': easyRound.highestScore,
      'normalPlayed': normalRound.playedCount,
      'normalWin': normalRound.winningCount,
      'normalScore': normalRound.highestScore,
      'hardPlayed': hardRound.playedCount,
      'hardWin': hardRound.winningCount,
      'hardScore': hardRound.highestScore,
      'endlessPlayed': endlessRound.playedCount,
      'endlessScore': endlessRound.highestScore,
      'totalScore': totalScore,
    });
  }

  String toJSON() => jsonEncode({
        'uid': user.uuid,
        'name': user.name,
        'email': user.email,
        'photoURL': user.avatar,
        'easyPlayed': easyRound.playedCount,
        'easyWin': easyRound.winningCount,
        'easyScore': easyRound.highestScore,
        'normalPlayed': normalRound.playedCount,
        'normalWin': normalRound.winningCount,
        'normalScore': normalRound.highestScore,
        'hardPlayed': hardRound.playedCount,
        'hardWin': hardRound.winningCount,
        'hardScore': hardRound.highestScore,
        'endlessPlayed': endlessRound.playedCount,
        'endlessScore': endlessRound.highestScore,
        'totalScore': totalScore,
      });
}
