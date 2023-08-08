import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/screens/add_post_screen.dart';
import 'package:instagram_clone/utils/colors.dart';
import '../screens/home_screen.dart';
import '../screens/notification_screen.dart';
import '../screens/profile_screen.dart';
import '../screens/search_screen.dart';

class MobileScreenLayout extends StatefulWidget {
  const MobileScreenLayout({super.key});

  @override
  State<MobileScreenLayout> createState() => _MobileScreenLayoutState();
}

class _MobileScreenLayoutState extends State<MobileScreenLayout> {

  final widgets =  [
    const HomeScreen(),
    const SearchScreen(),
    const AddPostScreen(),
    const NotificationScreen(),
    ProfileScreen(uid: FirebaseAuth.instance.currentUser!.uid),
  ];

  int _page = 0;

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body:  SafeArea(
          child: widgets[_page]),
      bottomNavigationBar: CupertinoTabBar(
        
        onTap: (value){
          setState(() {
            _page = value;
          });
        },
        currentIndex: _page,
        backgroundColor: mobileBackgroundColor,
        items: [
        BottomNavigationBarItem(
          icon: Icon(
            Icons.home,
            color: _page == 0 ? primaryColor : secondaryColor,
          ),
          
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.search,
            color: _page == 1 ? primaryColor : secondaryColor,
          ),
          
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.add_circle_rounded,
            color: _page == 2 ? primaryColor : secondaryColor,
          ),
          
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.favorite_rounded,
            color: _page == 3 ? primaryColor : secondaryColor,
          ),
          
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.person,
            color: _page == 4 ? primaryColor : secondaryColor,
          ),
          
        ),
      ]),
    );
  }
}
