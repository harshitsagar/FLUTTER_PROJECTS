import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'main.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sudoku!"),
      ),
      body: ChangeNotifierProvider<SudokuChangeNotifier>(
        create: (context) => SudokuChangeNotifier(),
        child: SudokuSolverPage(),
      ),
    );
  }
}
