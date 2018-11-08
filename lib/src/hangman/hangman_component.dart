import 'dart:async';

import 'package:angular/angular.dart';
import 'package:angular_components/angular_components.dart';
import 'package:hangman/src/hangman/hangman_game.dart';

@Component(
  selector: 'hangman',
  styleUrls: ['hangman_component.css'],
  templateUrl: 'hangman_component.html',
  directives: [
    NgFor,
  ],
  providers: []
)
class HangmanComponent implements OnInit {
  HangmanGame hangmanGame;
  static const List<String> wordList = const ["PLENTY","ACHIEVE","CLASS","STARE","AFFECT","THICK","CARRIER","BILL","SAY","ARGUE","OFTEN","GROW","VOTING","SHUT","PUSH","FANTASY","PLAN","LAST","ATTACK","COIN","ONE","STEM","SCAN","ENHANCE","PILL","OPPOSED","FLAG","RACE","SPEED","BIAS","HERSELF","DOUGH","RELEASE","SUBJECT","BRICK","SURVIVE","LEADING","STAKE","NERVE","INTENSE","SUSPECT","WHEN","LIE","PLUNGE","HOLD","TONGUE","ROLLING","STAY","RESPECT","SAFELY"];

  static const List<String> imageList = const [
    "https://i.imgur.com/kReMv94.png",
    "https://i.imgur.com/UFP8RM4.png",
    "https://i.imgur.com/9McnEXg.png",
    "https://i.imgur.com/vNAW0pa.png",
    "https://i.imgur.com/8UFWc9q.png",
    "https://i.imgur.com/rHCgIvU.png",
    "https://i.imgur.com/CtvIEMS.png",
    "https://i.imgur.com/Z2mPdX0.png"
  ];

  static const String winImage = "https://i.imgur.com/QYKuNwB.png";

  List<String> letters = [];
  List<String> lettersGuessed = [];
  String gallowsImage;
  String word;

  @override
  Future<Null> ngOnInit() async {
    hangmanGame = new HangmanGame(wordList);
    // set up event listeners
    hangmanGame.onChange.listen(updateWordDisplay);
    hangmanGame.onWrong.listen(updateGallowsImage);
    hangmanGame.onWin.listen(win);
    hangmanGame.onLose.listen(gameOver);

    // put the letter buttons on the screen
    letters = await generateAlphabet();
    gallowsImage = imageList[0];

    // start the first game
    newGame();
  }

  List<String> generateAlphabet() {
    // get the character code for a capital 'A'
    int startingCharCode = 'A'.codeUnits.first;

    // create a list of 26 character codes (from 'A' to 'Z')
    List<int> charCodes = new List<int>.generate(26, (int index) =>
    startingCharCode + index);

    // map character codes into a list of actual strings
    return charCodes.map((int code) =>
    new String.fromCharCode(code)).toList();
  }

  void updateWordDisplay(String word) {
    this.word = word;
  }

  void updateGallowsImage(int wrongGuesses) {
    gallowsImage = imageList[wrongGuesses];
  }

  void win([_]) {
    gallowsImage = winImage;
    gameOver();
  }

  void gameOver([_]) {

  }

  void newGame([_]) {
    // set up the game model
    hangmanGame.newGame();
    lettersGuessed.clear();

    // show the first gallows image
    updateGallowsImage(0);
  }
}
