import 'package:flutter/material.dart';
        
        
        class ShortWidget extends StatefulWidget {
        @override
        _ShortWidgetState createState() => _ShortWidgetState();
        }
        
        class _ShortWidgetState extends State<ShortWidget> {
        @override
        Widget build(BuildContext context) {
        // Figma Flutter Generator ShortWidget - COMPONENT
        
         return Container(
      width: 250,
      height: 60,
      decoration: BoxDecoration(
          borderRadius : BorderRadius.circular(15),
      color : Color.fromRGBO(155, 164, 180, 1),),
      child:Row(children: <Widget>[
        Expanded(flex: 4,
        child:Container(child:
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
        Container(
          padding:EdgeInsets.only(left: 20,top:5),
          child: Text("8號",textAlign: TextAlign.left , style: TextStyle(
        color: Color.fromRGBO(255, 255, 255, 1),
        fontSize: 16,),
          ),
      ),
      SizedBox(height: 8),
      Row(children: <Widget>[
        Container(
          padding:EdgeInsets.only(left: 20,bottom:0),
          child:Text('有效日期',textAlign: TextAlign.center , style: TextStyle(
        color: Color.fromRGBO(255, 255, 255, 1),
        fontSize: 12,),) ,
          ),
          Container(
          padding:EdgeInsets.only(left:20,bottom:0),
          child:Text('2021/08/31',textAlign: TextAlign.left, style: TextStyle(
        color: Color.fromRGBO(255, 255, 255, 1),
        fontSize: 16,),) ,
          ),
      ],)
      ],
      ) , ),),
      Expanded(flex: 1,child:Container(width: 20,height: 30,
        child:Text('1', textAlign: TextAlign.center, style: TextStyle(
        color: Color.fromRGBO(255, 255, 255, 1),
        fontSize: 25,)) ) ,)
      ],)      
      );
        }
        }
        