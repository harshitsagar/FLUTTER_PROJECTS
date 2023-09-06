import 'dart:async';
import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:snake_game/blank_pixel.dart';
import 'package:snake_game/food_pixel.dart';
import 'package:snake_game/highscore_tile.dart';
import 'package:snake_game/snake_pixel.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

//  for updating snake direction ........
enum snake_Direction {UP , DOWN , LEFT , RIGHT}

class _HomePageState extends State<HomePage> {

  // grid dimesions ........
  int rowSize = 10 ;
  int totalNumberOfSquares = 100 ;

  // snake position ........
  List<int> snakePos = [0,1,2,] ;

  // snake direction is initially to the right ......
  var currentDirection = snake_Direction.RIGHT ;

  // food position ........
  int foodPos = 55 ;

  // user score .....
  int currentScore = 0 ;

  // variable for checking whether
  bool gameHasStarted = false ;

  // game settings .....
  final nameController = TextEditingController() ;

  // highscore list ......
  List<String> highscore_DocIds = [] ;
  late final Future? letsGetDocIds ;

  @override
  void initState() {
    letsGetDocIds = getDocId() ;
    super.initState();
  }

  Future getDocId() async {
    await FirebaseFirestore
        .instance.collection("highscores")
        .orderBy("score", descending: true)
        .limit(10).get().then((value) => value.docs.forEach((element) {
          highscore_DocIds.add(element.reference.id) ;
    })) ;
  }

  // start the game !!!!!
  void startGame() {

    gameHasStarted = true ;

    Timer.periodic(Duration(milliseconds: 200), (timer) {

      setState(() {

        // keep the snake moving .......
        moveSnake() ;

        // check if the game is over ........
        if(gameOver()) {

          timer.cancel() ;

          // display a message to the user .......
          showDialog(
              context: context,
              barrierDismissible: false,
              builder: (context) {
                return AlertDialog(
                  title: Text('Game Over'),
                  content: Column(
                    children: [
                      Text('Your score is : ' + currentScore.toString()),
                      TextField(
                        controller: nameController,
                        decoration: InputDecoration(hintText: 'Enter your name .....'),
                      ),
                    ],
                  ),

                  actions: [
                    MaterialButton(
                      onPressed: () {
                        submitScore() ;
                        Navigator.pop(context) ;
                        newGame() ;
                      },
                      child: Text('Submit'),
                      color: Colors.pink,
                    )
                  ],

                );
              }
          );

        }

      });

    });
  }

  void submitScore() {

    // get access to the collection .......
    var database = FirebaseFirestore.instance ;

    // add data to firebase ......
    database.collection('highscores').add({

      "name": nameController.text,
      "score": currentScore,

    });

  }

  Future newGame() async {

    highscore_DocIds = [] ;
    await getDocId() ;

    setState(() {

      // just reset all the values ......
      snakePos = [0,1,2,] ;
      foodPos = 55 ;
      currentDirection = snake_Direction.RIGHT ;
      gameHasStarted = false ;
      currentScore = 0 ;

    });

  }

  void eatFood() {

    // making sure the new food isn't where the snake is present .........
    while(snakePos.contains(foodPos)) {
      foodPos = Random().nextInt(totalNumberOfSquares) ;
      print(snakePos);
    }

    // incrementing the score when the snake is eating food ........
    currentScore++ ;

  }

  void moveSnake() {

    switch(currentDirection) {

      case snake_Direction.RIGHT : {

        // when snake is at the right wall , need to re-adjust ........
        if(snakePos.last % rowSize == 9){
          snakePos.add(snakePos.last+1-rowSize) ;
        }

        else {
          // add a head .......
          snakePos.add(snakePos.last+1) ;
        }

      }
      break ;

      case snake_Direction.LEFT : {

        // when snake is at the left wall , need to re-adjust ........
        if(snakePos.last % rowSize == 0){
          snakePos.add(snakePos.last-1+rowSize) ;
        }

        else {
          // add a head .......
          snakePos.add(snakePos.last-1) ;
        }

      }
      break ;

      case snake_Direction.UP : {

        // when snake is moving on UP ........

        // add a head .......
        if(snakePos.last < rowSize) {
          snakePos.add(snakePos.last - rowSize + totalNumberOfSquares) ;
        }

        else{
          snakePos.add(snakePos.last - rowSize) ;
        }

      }
      break ;

      case snake_Direction.DOWN : {

        // when snake is moving on DOWN ........

        // add a head .......
        if(snakePos.last + rowSize > totalNumberOfSquares) {
          snakePos.add(snakePos.last + rowSize - totalNumberOfSquares) ;
        }

        else{
          snakePos.add(snakePos.last + rowSize) ;
        }

      }
      break ;

        default:
    }

    // snake is eating food .......
    if(snakePos.last == foodPos) {
      eatFood() ;
    }

    else {
      // remove tail .......
      snakePos.removeAt(0) ;
    }

  }

  // game over .....
  bool gameOver() {

    // the game is over when the snake runs into itself .........
    // this occur when there is a duplicate position in the snakePos list ......

    // this list is the body of the snake (no head) .......
    List<int> bodySnake = snakePos.sublist(0,snakePos.length-1) ;

    if(bodySnake.contains(snakePos.last)) {
      return true ;
    }

    else {
      return false ;
    }

  }


  @override
  Widget build(BuildContext context) {

    // get the screen width ........
    double screenWidth = MediaQuery.of(context).size.width ;

    return Scaffold(
      backgroundColor: Colors.black,
      body: RawKeyboardListener(
        focusNode: FocusNode(),
        autofocus: true,
        onKey: (event) {
          if(event.isKeyPressed(LogicalKeyboardKey.arrowDown) && currentDirection != snake_Direction.UP){
            currentDirection = snake_Direction.DOWN ;
          }

          else if(event.isKeyPressed(LogicalKeyboardKey.arrowUp) && currentDirection != snake_Direction.DOWN) {
            currentDirection = snake_Direction.UP ;
          }

          else if(event.isKeyPressed(LogicalKeyboardKey.arrowLeft) && currentDirection != snake_Direction.RIGHT) {
            currentDirection = snake_Direction.LEFT ;
          }

          else if(event.isKeyPressed(LogicalKeyboardKey.arrowRight) && currentDirection != snake_Direction.LEFT) {
            currentDirection = snake_Direction.RIGHT ;
          }

        },
        child: SizedBox(
          width: screenWidth > 428 ? 428 : screenWidth,
          child: Column(
            children: [

              // Score card ......
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [

                    // user current score ......
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [

                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text('Current Score', style: TextStyle(fontSize: 20),),
                          ),

                          Text(
                            currentScore.toString(),
                            style: TextStyle(fontSize: 36),

                          ),
                        ],
                      ),
                    ),

                    // high scores, top 5 or 10 ......
                    Expanded(
                      child: gameHasStarted ? Container() : FutureBuilder(
                          future: letsGetDocIds,
                          builder: (context,snapshot) {
                            return ListView.builder(
                              itemCount: highscore_DocIds.length,
                              itemBuilder: ((context, index) {
                                return HighScoreTile(documentId: highscore_DocIds[index]);
                              }),
                            );
                          }
                      ),
                    ),

                  ],
                ),
              ),

              // game grid .......
              Expanded(

                flex: 3,

                child: GestureDetector(
                  onVerticalDragUpdate: (details){

                    if(details.delta.dy>0 && currentDirection!=snake_Direction.UP) {
                      currentDirection = snake_Direction.DOWN ;
                    }

                    else if(details.delta.dy<0 && currentDirection!=snake_Direction.DOWN) {
                      currentDirection = snake_Direction.UP ;
                    }
                  },

                  onHorizontalDragUpdate: (details) {

                    if(details.delta.dx>0 && currentDirection!=snake_Direction.LEFT) {
                      currentDirection = snake_Direction.RIGHT ;
                    }

                    else if(details.delta.dx<0 && currentDirection!=snake_Direction.RIGHT) {
                      currentDirection = snake_Direction.LEFT ;
                    }

                  },

                  child: GridView.builder(

                      itemCount: totalNumberOfSquares,
                      physics: const NeverScrollableScrollPhysics(),

                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: rowSize,
                      ),

                      itemBuilder: (context, index) {

                        if(snakePos.contains(index)) {
                          return const SnakePixel() ;
                        }

                        else if(foodPos == index) {
                          return const FoodPixel() ;
                        }

                        else {
                          return const BlankPixel() ;
                        }

                      }

                  ),
                ),
              ),

              // play button ......
              Expanded(
                child: Container(
                 child: Center(
                   child: MaterialButton(
                     child: Text('PLAY'),
                     color: gameHasStarted ? Colors.grey : Colors.pink,
                     onPressed: gameHasStarted ? () {} : startGame,
                   ),
                 ),
                ),
              ),


            ],
          ),
        ),
      ),
    );
  }
}
