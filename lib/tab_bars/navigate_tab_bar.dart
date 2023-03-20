import 'package:flutter/material.dart';
import 'package:twitter_clone/screens/for_you_tab_screen.dart';
import 'package:twitter_clone/components/floating_tweet_button.dart';


class NavigateTabBar extends StatefulWidget {
  const NavigateTabBar({Key? key}) : super(key: key);

  @override
  State<NavigateTabBar> createState() => _NavigateTabBarState();
}

class _NavigateTabBarState extends State<NavigateTabBar> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        floatingActionButton: FloatingTweetbutton(),
        appBar: AppBar(
          bottom: new PreferredSize(
              preferredSize: new Size(5.0, 5.0),
              child: TabBar(tabs: [
                Tab(text: 'For you'),
                Tab(
                  text: 'Following',
                )
              ])),
        ),
        body: TabBarView(
          children: [
            ForYouScreen(),
            Icon(
              Icons.add_alarm_outlined,
              color: Colors.white,
            )
          ],
        ),
      ),
    );
  }
}
