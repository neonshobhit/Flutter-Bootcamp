import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';

main() => runApp(LogoApp());

class Animateme extends AnimatedWidget {
  Animateme({Key key, Animation<double> animation})
      : super(key: key, listenable: animation);

  Widget build(BuildContext context){
    final Animation<double> animation = listenable as Animation<double>;
    return Center(
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        height: animation.value,
        width: animation.value,
        child: FlutterLogo(),
      )
    );
  }
}

class LogoApp extends StatefulWidget {
  @override
  _LogoAppState createState() => _LogoAppState();
}

class _LogoAppState extends State<LogoApp> with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController controller;

  @override
  void initState(){
    super.initState();
    controller = AnimationController(duration: const Duration(seconds: 30), vsync: this);
    animation = Tween<double> (begin: 0, end: 400).animate(controller)
    ..addStatusListener((status){
        if(status == AnimationStatus.completed){
          controller.reverse();
        }
        else if(status == AnimationStatus.dismissed){
          controller.forward();
        }
    })
    ..addStatusListener((state) => print('$state'));
    controller.forward();
    
  }

  @override
  Widget build(BuildContext context) => Animateme(animation: animation);

  @override
  void dispose(){
    controller.dispose();
    super.dispose();
  }
}

