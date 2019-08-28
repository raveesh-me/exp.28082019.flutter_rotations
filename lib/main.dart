import 'package:flutter/material.dart';
import 'dart:math' as math;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  AnimationController rotationController;

  Animation<double> rotationValueAnimation;
  @override
  void initState() {
    super.initState();
    rotationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    )
      ..addListener(() => setState(() {}))
      ..addStatusListener((AnimationStatus status) {
        if (status == AnimationStatus.completed) rotationController.reverse();
        if (status == AnimationStatus.dismissed) rotationController.forward();
      });

    rotationValueAnimation =
        Tween<double>(end: -math.pi / 2, begin: math.pi / 2)
            .animate(rotationController);

    rotationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Transform.rotate(
          angle: rotationValueAnimation.value,
          alignment: Alignment(1, -1),
          child: Container(
            height: 200,
            width: 50,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.black, Colors.white],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
