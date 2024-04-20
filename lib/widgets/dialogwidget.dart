import 'package:flutter/material.dart';

import '../datahandler/colors.dart';


void DialogBuilder(BuildContext context,List<Widget> ContainerWidget){
  showDialog(
    context: context,
  builder: (BuildContext context){
          return Dialog(
            elevation: 2,
          insetPadding: const EdgeInsets.all(20),
            backgroundColor: Colors.white,

            child:  Container(
              padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
              color:Colors.white , borderRadius: BorderRadius.circular(5)),
            child:  SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  SizedBox(height: 20),
                  InkWell(onTap:(){
                    Navigator.pop(context);
                  },
                  child : Container(child: Icon(
                          Icons.close,
                          color: AppColors.seventh,
                        )
                  
              ),
              ),
              SizedBox(height: 30,),
              Column( 
              children:ContainerWidget)
              
              
              ]),
            )));
            }
            );
}