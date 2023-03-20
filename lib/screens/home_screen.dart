import 'package:flutter/material.dart';
import 'package:twitter_clone/tab_bars/navigate_tab_bar.dart';
import 'package:twitter_clone/main.dart';
import 'search_screen.dart';

class HomeScreen extends StatefulWidget {
  static const String id = 'home_screen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}
int _currentIndex= 0;

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: CircleAvatar(
          backgroundColor: Colors.transparent,
          radius: 20,
          child: CircleAvatar(
backgroundImage: NetworkImage('https://www.thesprucepets.com/thmb/3ABKoAPm0Hu4PcWsDH1giawq7ck=/750x0/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/chinese-dog-breeds-4797219-hero-2a1e9c5ed2c54d00aef75b05c5db399c.jpg'),
            radius: 20,
          ),
        ),

      ),
      body: Center(
        child: IndexedStack(
          index: _currentIndex,
          children: [
            NavigateTabBar(),
           SearchScreen(),
            Icon(Icons.h_mobiledata),
            Icon(Icons.h_mobiledata),
            Icon(Icons.add),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
        currentIndex: _currentIndex,
        onTap: (int newIndex){
          setState(() {
            _currentIndex = newIndex;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home),label: '',backgroundColor: Colors.black,),
          BottomNavigationBarItem(icon: Icon(Icons.search),label: '',backgroundColor: Colors.black,),
          BottomNavigationBarItem(icon: Icon(Icons.mic),label: '',backgroundColor: Colors.black,),
          BottomNavigationBarItem(icon: Icon(Icons.notifications_none_rounded),label: '',backgroundColor: Colors.black,),
          BottomNavigationBarItem(icon: Icon(Icons.mail_outline_outlined),label: '',backgroundColor: Colors.black,),
        ],
      ),
    );
  }
}
