// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:app/controller.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main(List<String> args) {
  runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: const Color(0XFF40171A),
        body: MyApp(),
        bottomNavigationBar: BottomNavigationBar(
          iconSize: 40,
          type: BottomNavigationBarType.fixed, // Fixed
          backgroundColor:
              Colors.black.withOpacity(0.4), // <-- This works for fixed
          selectedItemColor: Color(0xFFEF798A),
          unselectedItemColor: Colors.grey,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
                backgroundColor: Colors.white),
            BottomNavigationBarItem(
                icon: Icon(Icons.people),
                label: 'Matches',
                backgroundColor: Colors.white),
            BottomNavigationBarItem(
                icon: Icon(Icons.message),
                label: 'Messages',
                backgroundColor: Colors.white),
            BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Profile',
                backgroundColor: Colors.white),
          ],
        ),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final SwiperController swiperController = SwiperController();
  final SwiperController swiperInnerController = SwiperController();

  List<List<String>> profileImages = [
    [
      'assets/images/pic1.jpeg',
      'assets/images/pic2.jpeg',
      'assets/images/pic3.jpeg',
    ],
    [
      'assets/images/alex1.jpg',
      'assets/images/alex2.jpg',
      'assets/images/alex3.jpg',
    ],
    [
      'assets/images/christo1.jpg',
      'assets/images/christo2.jpg',
      'assets/images/christo2.png'
    ]
  ];

  List<String> names = [
    'Ghazaleh Tanhaei',
    'Alex Vanellis',
    'Christos Mappouras',
  ];

  @override
  Widget build(BuildContext context) {
    final MainController mainController = Get.put(MainController());

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          flex: 5,
          child: Column(
            children: [
              Expanded(
                child: Swiper(
                  itemCount: 3,
                  controller: swiperController,
                  control: const SwiperControl(
                    color: Colors.white,
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                  ),
                  onIndexChanged: (value) => mainController.swipeIndex(value),
                  itemWidth: 550.0,
                  itemHeight: 800.0,
                  layout: SwiperLayout.TINDER,
                  itemBuilder: (BuildContext context, int mainIndex) {
                    return Swiper(
                      itemCount: 3,
                      autoplay: false,
                      controller: swiperInnerController,
                      scrollDirection: Axis.vertical,
              
                      control: const SwiperControl(),
                      layout: SwiperLayout.STACK,
                      itemWidth: 550.0,
                      itemHeight: 800.0,
                      itemBuilder: (BuildContext context, int innerIndex) {
                        return Image.asset(
                          profileImages[mainIndex][innerIndex],
                          fit: BoxFit.fill,
                        );
                      },
                    );
                  },
                ),
              ),
              Obx(() => ProfileCard(name: names[mainController.index.value]))
            ],
          ),
        ),
        Expanded(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                mainController.changeIndex(3);
                swiperController.move(mainController.index.value);
              },
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Icon(
                    Icons.thumb_down,
                    size: 40,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 60,
            ),
            GestureDetector(
              onTap: () {
                mainController.changeIndex(3);
                swiperController.move(mainController.index.value);
              },
              child: Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  color: Colors.green,
                ),
                child: const Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Icon(
                    Icons.thumb_up,
                    size: 40,
                    color: Colors.white,
                  ),
                ),
              ),
            )
          ],
        ))
      ],
    );
  }
}

class ProfileCard extends StatelessWidget {
  final String name;

  const ProfileCard({
    required this.name,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 420,
      height: 80,
      decoration: BoxDecoration(
        color: Color(0xFFF7A9A8),
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 20.0),
            ),
            Row(
              children: [
                Text(
                  'Idea and Value behind Art',
                  style: TextStyle(color: Colors.black, fontSize: 15.0),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
