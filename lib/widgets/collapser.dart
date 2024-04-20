// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class Collapser extends StatefulWidget {
  double CollapserHeight;
  double CollapserWidth;
  Widget CollapserMainWidget;
  Widget CollapserTextWidget;
  Widget CollapserOpeningWidget;
  Widget CollapserOpenedWidget;
  Widget CollapserSpreadWidget;
  bool isOpened;

  Collapser({
    Key? key,
    required this.CollapserHeight,
    required this.CollapserWidth,
    required this.CollapserMainWidget,
    required this.CollapserTextWidget,
    required this.CollapserOpeningWidget,
    required this.CollapserOpenedWidget,
    required this.CollapserSpreadWidget,
    required this.isOpened,
  }) : super(key: key);

  @override
  State<Collapser> createState() => _CollapserState();
}

class _CollapserState extends State<Collapser> {
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 800),
      child: Column(
      children: [
        InkWell(
          onTap:(){
            
        this.widget.isOpened = ! this.widget.isOpened;
        setState(() {
          
        });
          },
          child: AnimatedContainer(
      duration: Duration(milliseconds: 1500),
            color:Colors.white,
            height : this.widget.CollapserHeight , 
          width: this.widget.CollapserWidth , 
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              this.widget.isOpened == false?
            this.widget.CollapserOpeningWidget : 
            this.widget.CollapserOpenedWidget 
            ,
            Container(),
            Row(
              children: [
               this.widget.CollapserTextWidget,
               SizedBox(width: 10),
               this.widget.CollapserMainWidget,
              ],
            ),
          ],)
          ),
        ),

        this.widget.isOpened == false? Container(): 
        AnimatedContainer(
          duration: Duration(milliseconds: 800),
           child : this.widget.CollapserSpreadWidget)
      ],
    ),);
  }
}