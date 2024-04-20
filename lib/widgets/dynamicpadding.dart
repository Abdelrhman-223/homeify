
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:lottie/lottie.dart';

Widget XYZ = Container(
  height: 50,
  width: 30,
  color: Colors.black,
);

class DynamicPadding extends StatefulWidget {
  List<dynamic> ListOfParams;
  Widget Function(int) ContainersFunction;
  double ContainerHeight;
  double ContainerWidth;
  Axis ScrollDirection;
  DynamicPadding(
      {required this.ContainerHeight,
      required this.ContainerWidth,
      required this.ScrollDirection,
      required this.ContainersFunction,
      required this.ListOfParams,
      super.key});

  @override
  State<DynamicPadding> createState() => _DynamicPaddingState();
}

class _DynamicPaddingState extends State<DynamicPadding> {
    void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Directionality(
            textDirection: TextDirection.rtl,
            child: this.widget.ListOfParams.length ==0?
            SizedBox(height: 80,width: 80, child:Center(
              child: Lottie.asset(
              'assets/animation/Loading.json',
              width: 80, // Optional: Set the width
              height: 80, // Optional: Set the height
              fit: BoxFit.cover, // Optional: Adjust how the animation fits
              repeat: true, // Optional: Set to true for continuous looping
              //controller: _controller, // Optional: Use a controller for playback control
              onLoaded: (composition) {
                // Optional: Actions to perform when the animation is loaded
              },
            ),
            )):Container(
              height: this.widget.ListOfParams.length ==0?50:this.widget.ContainerHeight,
              width:this.widget.ListOfParams.length ==0?50: MediaQuery.sizeOf(context).width,
              child: ListView.separated(
                  itemBuilder: (context, index) {
                    return  this.widget.ContainersFunction(index);
                        
                  },
                  separatorBuilder: ((context, index) =>
                      Container(height: 10, width: 5)),
                  itemCount: this.widget.ListOfParams.length ,
                  scrollDirection: this.widget.ScrollDirection== null? Axis.horizontal : this.widget.ScrollDirection),
            ),
          );
        ;
  }
}








