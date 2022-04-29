//flutter logo moves forward and backward + curved animation
import 'package:flutter/material.dart';

class AnimationHomePage extends StatefulWidget {
  const AnimationHomePage({Key? key}) : super(key: key);


  @override
  State<AnimationHomePage> createState() => _AnimationHomePageState();
}

class _AnimationHomePageState extends State<AnimationHomePage>  with SingleTickerProviderStateMixin{

  late Animation<int> animation;
  late AnimationController controller;                                          //moves animation (forward/reverse)

  @override
  void initState() {
    // TODO: implement initState
    controller = AnimationController(
      duration: const Duration(
        milliseconds: 700,
        // seconds: 2
      ),
      vsync: this,
    );

    final Animation<double> curve = CurvedAnimation(parent: controller, curve: Curves.easeInOut);
    animation = IntTween(begin: 0, end: 255).animate(curve);
    //animation = Tween<double>(begin: 0, end: 300).animate(controller);
    animation.addListener(() {                                                  //whenever animation value --> set state
      setState(() {
        //print(animation.value);
      });
    });

    animation.addStatusListener((status) {                                      //tell status on every change
      if(status == AnimationStatus.completed){                                  //makes animation run in loop
        controller.reverse();
      }
      if(status == AnimationStatus.dismissed){
        controller.forward();
      }
    });
    //controller.forward();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center (
        child: SizedBox(
          child: FlutterLogo(),
          height: animation.value.toDouble(),
          width: animation.value.toDouble(),
        ),
      ),
      floatingActionButton: FloatingActionButton(                               //free button to start animation
        onPressed: (){
          setState(() {
            controller.forward();
          });
        },
      ),
    );
  }
}
