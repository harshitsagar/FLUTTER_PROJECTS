import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/basic.dart';
import 'package:flutter/src/widgets/framework.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            ElevatedButton.icon(
                onPressed: () {
                  Navigator.pushNamed(context, "/home");
                },
                icon: Icon(Icons.add_to_home_screen),
                label: Text('GO TO HOME')
            ),

          ],
        ),
      ),
    );
  }
}
