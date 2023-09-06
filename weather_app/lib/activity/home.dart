import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  late String username ;

  // Async - Function start but return some delayed .

  void getData() async {

    await Future.delayed(Duration(seconds: 2), () {

      username = "Harshit" ;

    });

  }

  void showData() {

    getData() ;
    print(username);

  }

  int counter = 1 ;

  @override
  void initState() {
    super.initState();

    showData();

    print('This is init state fucntion') ;

  }

  @override
  void setState(VoidCallback fn) {
    super.setState(fn);

    print('Set state called !!!!!') ;
    
  }

  @override
  void dispose() {
    super.dispose();

    print('Widget Destroyed !!!!!') ;

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: Text('Home Activity'),
      ),

      body: Column(
        children: [

          FloatingActionButton(onPressed: () => setState(() {
            counter += 1 ;
          })),

          Text("$counter"),

        ],
      ),

    );
  }
}



