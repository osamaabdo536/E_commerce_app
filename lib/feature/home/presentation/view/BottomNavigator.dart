import 'dart:developer';

import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:ecommerce_app/core/utils/app_theme.dart';
import 'package:flutter/material.dart';

import 'home_view.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  /// Controller to handle PageView and also handles initial page
  final _pageController = PageController(initialPage: 0);

  /// Controller to handle bottom nav bar and also handles initial page
  final NotchBottomBarController _controller = NotchBottomBarController(index: 0);

  int maxCount = 5;

  @override
  void dispose() {
    _pageController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    /// widget list
    final List<Widget> bottomBarPages = [
      HomeView(),
      HomeView(),
      HomeView(),
      HomeView(),
      HomeView(),
    ];
    return Scaffold(
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: List.generate(bottomBarPages.length, (index) => bottomBarPages[index]),
      ),
      extendBody: true,
      bottomNavigationBar: (bottomBarPages.length <= maxCount)
          ? AnimatedNotchBottomBar(
        circleMargin: 0,
        /// Provide NotchBottomBarController
        notchBottomBarController: _controller,
        color: MyTheme.primaryColor,
        showLabel: true,
        textOverflow: TextOverflow.visible,
        maxLine: 1,
        shadowElevation: 0,
        kBottomRadius: 0,


        notchColor: Colors.white,

        /// restart app if you change removeMargins
        removeMargins: false,
        bottomBarWidth: MediaQuery.sizeOf(context).width,
        showShadow: true,
        durationInMilliSeconds: 300,

        itemLabelStyle: const TextStyle(fontSize: 10),

        elevation: 1,
        bottomBarItems: const [
          BottomBarItem(
            inActiveItem: Icon(
              Icons.home_filled,
              color: Colors.blueGrey,
            ),
            activeItem: Icon(
              Icons.home_filled,
              color: Colors.blueAccent,
            ),

          ),
          BottomBarItem(
            inActiveItem: Icon(Icons.star, color: Colors.blueGrey),
            activeItem: Icon(
              Icons.star,
              color: Colors.blueAccent,
            ),
            itemLabel: 'Page 2',
          ),
          BottomBarItem(
            inActiveItem: Icon(
              Icons.settings,
              color: Colors.blueGrey,
            ),
            activeItem: Icon(
              Icons.settings,
              color: Colors.pink,
            ),
            itemLabel: 'Page 3',
          ),
          BottomBarItem(
            inActiveItem: Icon(
              Icons.person,
              color: Colors.blueGrey,
            ),
            activeItem: Icon(
              Icons.person,
              color: Colors.yellow,
            ),
            itemLabel: 'Page 4',
          ),
        ],
        onTap: (index) {
          log('current selected index $index');
          _pageController.jumpToPage(index);
        },
        kIconSize: 24.0,
      )
          : null,
    );
  }
}
