import 'package:flutter/material.dart';

class Mybarrier extends StatelessWidget {

  final size ;

  const Mybarrier({super.key, this.size});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: size,

      decoration: BoxDecoration(
        color: Colors.green,
        border: Border.all(width: 10 , color: Colors.green.shade700),
        borderRadius: BorderRadius.circular(15)
      ),
    );
  }
}







