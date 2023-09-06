import 'package:flutter/material.dart';

import '../utils/colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<StatefulWidget> createState() => _HomeScreenState() ;

}

class _HomeScreenState extends State<HomeScreen> {

  int _page = 0 ;

  onPageChanged(int page) {

    setState(() {
      _page = page ;
    });

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: footerColor,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.grey,
          onTap: onPageChanged,
          currentIndex: _page,
          type: BottomNavigationBarType.fixed,

          items: const [

            BottomNavigationBarItem(
                icon: Icon(Icons.comment_bank),
                label: 'Meet & Char',
            ),

            BottomNavigationBarItem(

              icon: Icon(Icons.lock_clock),
              label: 'Meetings',
            ),

            BottomNavigationBarItem(
              icon: Icon(Icons.person_outline),
              label: 'Contracts',
            ),

            BottomNavigationBarItem(
              icon: Icon(Icons.settings_outlined),
              label: 'Settings',
            ),

          ],

      ),


    );
  }
}






