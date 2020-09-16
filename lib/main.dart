import 'dart:math';

import 'package:codingcounselor/LessonQuiz.dart';
import 'package:codingcounselor/LessonData.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:audioplayers/audio_cache.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Coding Counselor',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Coding Counselor'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  AppState _state = AppState.menu;
  Languages _currentLanguage;
  List _currentLanguageLessons;
  Map<Languages, Map<String, int>> _lessonScores = Map();
  int _currentProgressLevel;
  Map _currentLesson;
  LessonQuiz _quiz;
  int _selectedAnswerIndex = 0;
  TextStyle _buttonTextStyle = TextStyle(fontSize: 25);
  AudioCache player = AudioCache();

  @override
  void initState() {
    super.initState();
    loadInScores();
    loadInSounds();
  }

  void loadInScores() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    for (Languages language in languageData.keys) {
      _lessonScores[language] = Map();
      for (Map lesson in languageData[language]) {
        _lessonScores[language][lesson[LessonPart.name]] = prefs.getInt(lesson[LessonPart.name]) ?? 0;
      }
    }
  }

  void saveScores() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt(_quiz.name, _lessonScores[_currentLanguage][_quiz.name]);
  }

  // chime.mp3 record by KevinGC, downloaded at
  // http://soundbible.com/1598-Electronic-Chime.html
  // buzzer.mp3 recorded by Mike Koenig, downloaded at
  // http://soundbible.com/1206-Door-Buzzer.html
  void loadInSounds() {
    player.loadAll(["buzzer.mp3", "chime.mp3"]);
  }

  @override
  Widget build(BuildContext context) {
    if (_state == AppState.menu) {
      return mainMenuScreen();
    } else if (_state == AppState.languageMenu) {
      return languageMenuScreen();
    } else if (_state == AppState.lessonPreview) {
      return previewScreen();
    } else if (_state == AppState.quiz) {
      return lessonQuiz();
    } else {
      return lessonEndScreen();
    }
  }

  Widget mainMenuScreen() {
    return Scaffold(
      appBar: AppBar(
        title: Text('Coding Counselor'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text('Which language do you want to practice with?',
                  style: TextStyle(fontSize: 20)),
              _basicButton(_languageString(Languages.Python),
                      () {_selectLanguage(Languages.Python);}),
              _basicButton(_languageString(Languages.Java),
                      () {_selectLanguage(Languages.Java);})
            ]
        )
      )
    );
  }

  void _selectLanguage(Languages language) {
    _currentLanguage = language;
    _currentLanguageLessons = languageData[_currentLanguage];
    setState(() {
      _state = AppState.languageMenu;
      calculateProgressLevel();
    });
  }

  void calculateProgressLevel() {
    _currentProgressLevel = 0;
    for (String lessonName in _lessonScores[_currentLanguage].keys) {
      if (_lessonScores[_currentLanguage][lessonName] >= 5) {
        _currentProgressLevel++;
      } else {
        break;
      }
    }
  }

  String _languageString(Languages language) {
    if (language == Languages.Python) {
      return "Python";
    } else if (language == Languages.Java) {
      return "Java";
    } else {
      return language.toString();
    }
  }

  void _returnToMainMenu() {
    setState(() {
      _state = AppState.menu;
      _currentLanguage = null;
      _currentLanguageLessons = null;
      _currentLesson = null;
      _currentProgressLevel = null;
    });
  }

  Widget languageMenuScreen() {
    List lessonNames = _getLessonNames();
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {_returnToMainMenu();}
        ),
        title: Text('${_languageString(_currentLanguage)} Lessons - '
            'Progress Level $_currentProgressLevel'),
      ),
      body: ListView.separated(
        itemCount: lessonNames.length,
        padding: EdgeInsets.all(8.0),
        itemBuilder: (BuildContext context, int index) {
          return _lessonSelectButton(lessonNames[index], index);
        },
        separatorBuilder: (BuildContext context, int index) => Divider(),
      )
    );
  }

  List _getLessonNames() {
    List names = List();
    for (Map lesson in _currentLanguageLessons) {
      names.add(lesson[LessonPart.name]);
    }
    return names;
  }

  Widget _lessonSelectButton(String lessonName, int lessonIndex) {
    if (lessonIndex <= _currentProgressLevel) {
      return _basicButton('$lessonName - Score ${_lessonScores[_currentLanguage][lessonName]}', () {_selectLesson(lessonIndex);});
    } else {
      return _basicButton('$lessonName - Progress level too low to attempt', null);
    }
  }

  void _selectLesson(int lessonIndex) {
    setState(() {
      _state = AppState.lessonPreview;
      print(lessonIndex);
      _currentLesson = _currentLanguageLessons[lessonIndex];
    });
  }

  Widget previewScreen() {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            _returnToLanguageSelect();
          },
        ),
        title: Text("${_languageString(_currentLanguage)}: ${_currentLesson[LessonPart.name]}"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(_currentLesson[LessonPart.desc],
              style: TextStyle(fontSize: 20),),
            _videoLinkButton(),
            _basicButton("Start Lesson", () {_startLesson();})
          ],
        ),
      ),
    );
  }

  Widget _videoLinkButton() {
    if (_currentLesson[LessonPart.videoLink] != null) {
      return _basicButton("Video Link", () {_launchVideoLink();});
    }
    return _basicButton("Video Link Unavailable", null);
  }

  void _launchVideoLink() {
    try {
      _launchURL(_currentLesson[LessonPart.videoLink].toString());
    } catch (Exception) {
      _errorButton('Video unable to launch');
    }
  }

  // Copied almost entirely from the sample code here:
  // https://api.flutter.dev/flutter/material/AlertDialog-class.html
  Future<void> _errorButton(String text) async {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Something went wrong"),
          content: SingleChildScrollView(
            child: ListBody(
              children: [Text(text)],
            )
          ),
          actions: [
            FlatButton(
              child: Text('ok'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            )
          ],
        );
      }
    );
  }

  Widget _basicButton(String text, Function onPress) {
    return Container(
      height: 50,
        width: 300,
        child: RaisedButton(
          onPressed: onPress,
          child: Text(text, style: _buttonTextStyle),
        )
    );
  }

  void _returnToLanguageSelect() {
    setState(() {
      _state = AppState.languageMenu;
      _currentLesson = null;
      _quiz = null;
    });
  }

  void _startLesson() {
    setState(() {
      _state = AppState.quiz;
      _quiz = LessonQuiz(_currentLesson, Random());
    });
  }

  void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw Exception('could not launch $url');
    }
  }

  Widget lessonQuiz() {
    return Scaffold(
      appBar: AppBar(
        title: Text("${_currentLesson[LessonPart.name]}"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: answerSelection(),
        ),
      )
    );
  }

  void _submitAnswer() {
    Outcome outcome = _quiz.inputAnswer(_selectedAnswerIndex);
    _playSound(outcome);
    setState(() {
      _updateScore();
      _selectedAnswerIndex = 0;
      if (_quiz.testStatus() != TestStatus.ongoing) {
        _state = AppState.lessonEnd;
        saveScores();
        calculateProgressLevel();
      }
    });
  }

  void _updateScore() => _lessonScores[_currentLanguage][_quiz.name] = _quiz.score;

  List<Widget> answerSelection() {
    List<Widget> answerSelection = answerSelectButtons();
    answerSelection.add(_basicButton("Submit", (){_submitAnswer();}));
    answerSelection.insert(0, Text(_quiz.currentQuestion().question, style: _buttonTextStyle));
    answerSelection.insert(0, _progressBar(_quiz.score / _quiz.scoreNeededToPass));
    return answerSelection;
  }

  List<Widget> answerSelectButtons() {
    List<Widget> buttons = List();
    List<String> answers = _quiz.currentQuestion().answers;
    for (int i=0; i<answers.length; i++) {
      buttons.add(radioButton(answers[i], i));
    }
    return buttons;
  }

  Widget radioButton(String text, int value) {
    return ListTile(
      title: Text(text, style: _buttonTextStyle),
      leading: Radio(groupValue: _selectedAnswerIndex, value: value, onChanged: (int value) {setState(() {
        _selectedAnswerIndex = value;
      });
      },),
    );
  }

  void _playSound(Outcome outcome) {
    if (outcome == Outcome.correct) {
      player.play('chime.mp3');
    } else {
      player.play('buzzer.mp3');
    }
  }

  Widget _progressBar(double value) {
    return LinearProgressIndicator(
      value: _quiz.score / _quiz.scoreNeededToPass,
      minHeight: 10,
      valueColor: AlwaysStoppedAnimation<Color>(Colors.green),);
  }

  Widget lessonEndScreen() {
    return Scaffold(
      appBar: AppBar(
        title: Text("${_currentLesson[LessonPart.name]}"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(endingString(), style: _buttonTextStyle,),
            _basicButton("Return to Menu", () {_returnToLanguageSelect();})
          ],
        ),
      ),
    );
  }

  String endingString() {
    if (_quiz.testStatus() == TestStatus.passed) {
      return "You passed the lesson! \nGood job";
    } else {
      return "You failed.";
    }
  }

}

enum AppState{
  menu,
  languageMenu,
  quiz,
  lessonPreview,
  lessonEnd
}

enum Languages{
  Python,
  Java
}