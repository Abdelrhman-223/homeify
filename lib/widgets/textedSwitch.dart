// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SwitchTexted extends StatefulWidget {
  double SwitchHeight;
  double SwitchWidth;
  Color SwitchColorON;
  Color SwitchColorOFF;
  String SwitchTextON;
  String SwitchTextOFF;
  double SwitchButtonWidth;
  double SwitchButtonRadius;
  Color ButtonColorON;
  Color ButtonColorOFF;
  double SwitchRadius;
  bool SwitchState;
  double FontSizeON;
  double FontSizeOFF;
  Color FontColor;
  double SwitchPadding;

  SwitchTexted({
    Key? key,
    required this.SwitchHeight,
    required this.SwitchWidth,
    required this.SwitchColorON,
    required this.SwitchColorOFF,
    required this.SwitchTextON,
    required this.SwitchTextOFF,
    required this.SwitchButtonWidth,
    required this.SwitchButtonRadius,
    required this.ButtonColorON,
    required this.ButtonColorOFF,
    required this.SwitchRadius,
    required this.SwitchState,
    required this.FontSizeON,
    required this.FontSizeOFF,
    required this.FontColor,
    required this.SwitchPadding,
  }) : super(key: key);

  @override
  State<SwitchTexted> createState() => _SwitchTextedState();
}

class _SwitchTextedState extends State<SwitchTexted> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap : (){
        if(this.widget.SwitchState == true){
          this.widget.SwitchState = false;
          setState(() {
            
          });
        }else {
          this.widget.SwitchState = true;
          
          setState(() {
            
          });
        }
      },
      child: AnimatedContainer(
  padding: EdgeInsets.all(this.widget.SwitchPadding),

        duration: Duration(milliseconds: 500),
              decoration : BoxDecoration(
                  boxShadow: [
         BoxShadow(
        color: Colors.black,
        offset: Offset(-5.0, 5.0), // Negative offset for inner shadow
        blurRadius: 10.0,
        spreadRadius: -10.0,  // Negative spread radius for inner shadow
      ),
        ],
                borderRadius: BorderRadius.circular(this.widget.SwitchRadius),
        color : this.widget.SwitchState == true ? this.widget.SwitchColorON :this.widget.SwitchColorOFF, 
              ),
        height : this.widget.SwitchHeight,
        width : this.widget.SwitchWidth,
        child: Container(
          decoration : BoxDecoration(
                 
                  boxShadow: [
         BoxShadow(
        color: Colors.black.withOpacity(0.9),
        offset: Offset(0.0, -5.0), // Negative offset for inner shadow
        blurRadius: 3.0,
        spreadRadius: -6.0,  // Negative spread radius for inner shadow
      ),
        ],
                borderRadius: BorderRadius.circular(this.widget.SwitchRadius),
        color : this.widget.SwitchState == true ? this.widget.SwitchColorON :this.widget.SwitchColorOFF, 
              ),
          child: Row(
            children: [
              this.widget.SwitchState == true ? Container( height : this.widget.SwitchHeight , 
              width: this.widget.SwitchButtonWidth,
              decoration : BoxDecoration(
                borderRadius: BorderRadius.circular(this.widget.SwitchButtonRadius),
                color : this.widget.SwitchState == true ? this.widget.ButtonColorON :this.widget.ButtonColorOFF, 
              )
              
              ) :Text(this.widget.SwitchState == true ? this.widget.SwitchTextON : this.widget.SwitchTextOFF,
              style: GoogleFonts.almarai(fontWeight: FontWeight.w700,
              color:this.widget.FontColor , 
              fontSize: this.widget.FontSizeOFF)) ,
            
            
              this.widget.SwitchState == false ? Container( height : this.widget.SwitchHeight , 
              width: this.widget.SwitchButtonWidth,
              decoration : BoxDecoration(
                borderRadius: BorderRadius.circular(this.widget.SwitchButtonRadius),
                color : this.widget.SwitchState == true ? this.widget.ButtonColorON :this.widget.ButtonColorOFF, 
              )
              
              ) :Text(this.widget.SwitchState == true ? this.widget.SwitchTextON : this.widget.SwitchTextOFF,
              style: GoogleFonts.almarai(fontWeight: FontWeight.w700,
              color:this.widget.FontColor , 
              fontSize: this.widget.FontSizeON)) ,
          ],),
        )
      ),
    );
  }
}