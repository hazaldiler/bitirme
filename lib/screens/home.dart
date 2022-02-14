import 'package:flutter/material.dart';
import 'package:kidstarter/screens/alphabets.dart';
import 'package:kidstarter/screens/animals.dart';
import 'package:kidstarter/screens/car.dart';
import 'package:kidstarter/screens/colors.dart';
import 'package:kidstarter/screens/counting.dart';
import 'package:kidstarter/screens/draw.dart';
import 'package:kidstarter/screens/emotion.dart';
import 'package:kidstarter/screens/family.dart';
import 'package:kidstarter/screens/organ.dart';
import 'package:kidstarter/screens/quiz.dart';
import 'package:kidstarter/widgets/category_card.dart';

import 'fruit.dart';

class HomeScreen extends StatelessWidget {
  final List<Widget> _categories = [
    CategoryCard(
      title: 'Colors',
      primaryColor: Colors.orangeAccent[100],
      secondaryColor: Colors.orange,
      screen: ColorsScreen(
        title: 'Colors',
        primaryColor: Colors.orangeAccent[100],
        secondaryColor: Colors.orange,
      ),
    ),
    CategoryCard(
      title: '123',
      primaryColor: Colors.pinkAccent[100],
      secondaryColor: Colors.pink,
      screen: CountingScreen(
        title: '123',
        primaryColor: Colors.pinkAccent[100],
        secondaryColor: Colors.pink,
      ),
    ),
    CategoryCard(
      title: 'ABC',
      primaryColor: Colors.purpleAccent[100],
      secondaryColor: Colors.purple,
      screen: AlphabetsScreen(
        title: 'ABC',
        primaryColor: Colors.purpleAccent[100],
        secondaryColor: Colors.purple,
      ),
    ),
    CategoryCard(
      title: 'Animals',
      primaryColor: Color(0xFF3383CD),
      secondaryColor: Color(0xFF11249F),
      screen: Animal(
        title: 'Animals',
        primaryColor: Color(0xFF3383CD),
        secondaryColor: Color(0xFF11249F),
      ),
    ),
    CategoryCard(
      title: 'Family',
      primaryColor: Colors.redAccent[100],
      secondaryColor: Colors.red,
      screen: Family(
        title: 'Family',
        primaryColor: Colors.redAccent[100],
        secondaryColor: Colors.red,
      ),
    ),
    CategoryCard(
      title: 'Organ',
      primaryColor: Colors.lightBlueAccent[100],
      secondaryColor: Colors.lightBlueAccent,
      screen: organ(
        title: 'Organ',
        primaryColor: Colors.lightBlueAccent[100],
        secondaryColor: Colors.lightBlueAccent,
      ),
    ),
    CategoryCard(
      title: 'Fruit',
      primaryColor: Colors.greenAccent[100],
      secondaryColor: Colors.green,
      screen: fruit(
        title: 'Fruit',
        primaryColor: Colors.greenAccent[100],
        secondaryColor: Colors.green,
      ),
    ),
    CategoryCard(
      title: 'Emotion',
      primaryColor: Colors.amberAccent[100],
      secondaryColor: Colors.brown,
      screen: Emotion(
        title: 'Emotion',
        primaryColor: Colors.amberAccent[100],
        secondaryColor: Colors.brown,
      ),
    ),
    CategoryCard(
      title: 'Car',
      primaryColor: Colors.tealAccent[100],
      secondaryColor: Colors.teal,
      screen: car(
        title: 'Car',
        primaryColor: Colors.tealAccent[100],
        secondaryColor: Colors.teal,
      ),
    ),
    CategoryCard(
      title: 'Draw',
      primaryColor: Colors.orangeAccent[100],
      secondaryColor: Colors.orange,
      screen: draw(),
    ),
    CategoryCard(
      title: 'Quiz',
      primaryColor: Colors.amberAccent[100],
      secondaryColor: Colors.brown,
      screen: Quiz(
        title: 'Quiz',
        primaryColor: Colors.amberAccent[100],
        secondaryColor: Colors.brown,
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: Colors.grey[50],
          image: DecorationImage(
            image: AssetImage('assets/images/bg-bottom.png'),
            alignment: Alignment.bottomCenter,
          ),
        ),
        child: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              expandedHeight: 188.0,
              backgroundColor: Colors.grey[50],
              flexibleSpace: FlexibleSpaceBar(
                background: Image.asset(
                  'assets/images/bg-top.png',
                  fit: BoxFit.cover,
                  alignment: Alignment.topCenter,
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate(_categories),
            ),
          ],
        ),
      ),
    );
  }
}
