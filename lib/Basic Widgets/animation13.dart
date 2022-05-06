//flutter logo moves forward and backward + curved animation
import 'package:flutter/material.dart';

class AnimationPage extends StatefulWidget {
  const AnimationPage({Key? key}) : super(key: key);


  @override
  State<AnimationPage> createState() => _AnimationPageState();
}

class _AnimationPageState extends State<AnimationPage>  with SingleTickerProviderStateMixin{

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
          child: const FlutterLogo(),
          height: animation.value.toDouble(),
          width: animation.value.toDouble(),
        ),
      ),
      floatingActionButton: FloatingActionButton(                               //button to start animation
        onPressed: (){
          setState(() {
            controller.forward();
          });
        },
        child: const Icon(Icons.not_started),
      ),
    );
  }
}
