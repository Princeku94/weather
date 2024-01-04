import 'package:flutter/material.dart';
import 'package:weather/animation/anim_cloud.dart';
import 'package:weather/widgets/card/card_item.dart';
import 'package:weather/animation/sun_effect.dart';
import 'dart:math' as math;

import 'widgets/card/card_model.dart';
import 'animation/rain.dart';

List<CardModel> list = [
  const CardModel(time: '1:00 PM', temp: '38', comment: 'Sunny', icon: '☀️'),
  const CardModel(time: '9:00 AM', temp: '17', comment: 'Cloudy', icon: '☁️'),
  const CardModel(time: '6:00 PM', temp: '2', comment: 'Rainny', icon: '🌧'),
  const CardModel(time: '8:00 PM', temp: '10', comment: 'Cloudy', icon: '☁️'),
  const CardModel(time: '6:00 PM', temp: '3', comment: 'Rainny', icon: '🌧'),
];
final Key parallaxOne = GlobalKey();
String temp = '38';
String advice = ' Feels like sunny\nLet\'s take sun bath';
int selectedIndex = 0;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String comment = 'No Comment';
  @override
  Widget build(BuildContext context) {
    // final topPadding = MediaQuery.of(context).padding.top;
    // double res_width = MediaQuery.of(context).size.width;
    // double res_height = MediaQuery.of(context).size.height;
    return Container(
      height: double.infinity,
      decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
        Color.fromRGBO(145, 131, 222, 1),
        Color.fromRGBO(160, 148, 227, 1)
      ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
      child: Scaffold(
          appBar: AppBar(
            leading: SizedBox(
                height: 35.0,
                width: 33.0,
                child: Image.asset('assets/images/sun.png')),
            title: const Text(
              'Weather App',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 30, color: Colors.black),
            ),
          ),
          backgroundColor: Colors.transparent,
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              // crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                animatinWidget,
                

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '$temp°',
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 70,
                              color: Colors.white),
                        ),
                        const Text(
                          'Sunday, June 6',
                          style: TextStyle(fontSize: 16, color: Colors.white54),
                        ),
                        const Text(
                          'Mumbai',
                          style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),

                        const SizedBox(
                          height: 8,
                        ),

                       
                      ],
                    ),

                    Image.asset(
                      getGirl,
                      height: 150,
                    ),

                   
                  ],
                ),
                const SizedBox(
                  height: 25,
                ),
                Text(
                  getAdvice,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Text(
                      'Today',
                      style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Text(
                      'Tomorrow',
                      style: TextStyle(
                          fontSize: 20, color: Colors.white.withOpacity(0.3)),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 25,
                ),

                Expanded(
                  child: ListView.builder(
                      itemCount: list.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              temp = list[index].temp;
                              selectedIndex = index;
                              // comment = list[index].comment;
                            });
                          },
                          child: CardItem(
                              color: selectedIndex == index
                                  ? Colors.purple.withOpacity(0.7)
                                  : const Color.fromRGBO(145, 131, 222, 1)
                                      .withOpacity(0.3),
                              time: list[index].time,
                              temp: list[index].temp,
                              comment: list[index].comment,
                              icon: list[index].icon),
                        );
                      }),
                )
              ],
            ),
          )),
    );
  }
}

Widget get animatinWidget {
  if (int.parse(temp) > 20) {
    return const SunEffect();
  } else if (int.parse(temp) > 4) {
    return const CloudAnim();
  } else {
    return Transform.rotate(
      angle: math.pi / 4,
      child: SizedBox(
        height: 100,
        width: double.infinity,
        child: ParallaxRain(
          key: parallaxOne,
          dropColors: const [
            Colors.white,
          ],
          trail: true,
        ),
      ),
    );
  }
}

String get getAdvice {
  if (int.parse(temp) > 20) {
    return ' Feels like sunny\nLet\'s take sun bath';
  } else if (int.parse(temp) > 4) {
    return ' Feels like cloudy\nCarry Sweater with you';
  } else {
    return ' Feels like rainy\nCarry Umbrella with you';
  }
}

String get getGirl {
  if (int.parse(temp) > 20) {
    return 'assets/images/sunny_girl.png';
  } else if (int.parse(temp) > 4) {
    return 'assets/images/sweater_girl.png';
  } else {
    return 'assets/images/girl.png';
  }
}
