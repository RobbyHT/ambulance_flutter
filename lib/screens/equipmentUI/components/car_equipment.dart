import 'package:ambulance_flutter/screens/equipmentUI/components/longbtn.dart';
import 'package:ambulance_flutter/screens/equipmentUI/components/shortbtn.dart';
import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

        
        
        class CarWidget extends StatefulWidget {
        @override
        _CarWidgetState createState() => _CarWidgetState();
        }
        
        class _CarWidgetState extends State<CarWidget> {
          bool _showBackToTopButton = false;
          ScrollController _scrollController;
          //懸浮按鈕控制
        @override
        void initState() {
          super.initState();
          _scrollController = ScrollController()
            ..addListener(() {
              setState(() {
                if (_scrollController.offset >= 300) {
                  _showBackToTopButton = true; // show the back-to-top button
                } else {
                  _showBackToTopButton = false; // hide the back-to-top button
                }
              });
            });
        }
        @override
        void dispose() {
          _scrollController.dispose(); // dispose the controller
          super.dispose();
        }
      // This function is triggered when the user presses the back-to-top button
        void _scrollToTop() {
          _scrollController.animateTo(0,
              duration: Duration(seconds:1), curve: Curves.linear);
        }
        @override
        Widget build(BuildContext context) {
          Size size = MediaQuery.of(context).size;
        // Figma Flutter Generator Iphone11procarWidget - FRAME
        return Scaffold(
          backgroundColor: (Color.fromRGBO(20,39,78,1)) ,
          //懸浮按鈕
          floatingActionButton: FloatingActionButton(
            backgroundColor: (Color.fromRGBO(155, 164, 180, 50)),
          child: Icon(Icons.arrow_drop_up_rounded,size: 50,color:Color.fromRGBO(255, 255, 255, 50), ),
          onPressed: _scrollToTop,
        ),
        //滾動視窗
           body:SingleChildScrollView(
             controller: _scrollController,
          child: Column(
            children:<Widget>[
          SizedBox(width: 10,height: 10),
          Center(
            child: Container(
              width: 300,
              height: 50,
              decoration: BoxDecoration(
              borderRadius : BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),),
              border : Border.all(
              color: Color.fromRGBO(155, 164, 180, 1),
              width: 3)),
              alignment:Alignment.center,
              child: Text('車內設備',textAlign:TextAlign.center,style: TextStyle(
            color: Color.fromRGBO(255, 255, 255, 1),
            fontSize: 20),)
              ),
              ) ,
              SizedBox(width: 10,height: 20),
              //附有腳架滑輪之擔架床	
              LongWidget(inputText:'附有腳架滑輪之擔架床',day:'2021/08/31',number:'1'),
              SizedBox(width: 10,height: 20),
              //氧氣組
             Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:<Widget>[        
                  Container(width: 30,height: 130,decoration:BoxDecoration(borderRadius:BorderRadius.circular(10),color:Color.fromRGBO(155, 164, 180, 1)  ) , 
                  child:Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
              children:<Widget> [
                SizedBox(width: 10,height: 25),
              Container(child:
              Text( '氧',textAlign:TextAlign.center,style: TextStyle(color: Color.fromRGBO(255, 255, 255, 1),fontSize:16 ))),
              Container(child:
              Text('氣',textAlign:TextAlign.center,style: TextStyle( color: Color.fromRGBO(255, 255, 255, 1),fontSize:16 ))),
              Container(child:
              Text('組',textAlign:TextAlign.center,style: TextStyle(color: Color.fromRGBO(255, 255, 255, 1),fontSize:16 ))),
              ],),
               ),
               SizedBox(width: 10,height: 10),
              Column(children: <Widget>[
              ShortWidget(inputText:'攜帶式' ,day: '2021/09/30',number: '1',),SizedBox(width: 10,height: 10),
              ShortWidget(inputText:'固定式' ,day: '2021/09/30',number: '1',),
              ],)
              
                ] ,) ,
              SizedBox(width: 10,height: 10),
              LongWidget(inputText:'氧氣鼻管',day:'2021/08/31',number:'1'),
              SizedBox(width: 10,height: 10),
              //氧氣面罩
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:<Widget>[        
                  Container(width: 30,height: 270,decoration:BoxDecoration(borderRadius:BorderRadius.circular(10),color:Color.fromRGBO(155, 164, 180, 1)  ) , 
                  child:Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
              children:<Widget> [
                SizedBox(width: 10,height: 70),
              Container(child:
              Text( '氧',textAlign:TextAlign.center,style: TextStyle(color: Color.fromRGBO(255, 255, 255, 1),fontSize:16 ))),
              Container(child:
              Text('氣',textAlign:TextAlign.center,style: TextStyle( color: Color.fromRGBO(255, 255, 255, 1),fontSize:16 ))),
              Container(child:
              Text('面',textAlign:TextAlign.center,style: TextStyle(color: Color.fromRGBO(255, 255, 255, 1),fontSize:16 ))),
              Container(child:
              Text('罩',textAlign:TextAlign.center,style: TextStyle( color: Color.fromRGBO(255, 255, 255, 1),fontSize:16 ))),
              ],),
               ),
               SizedBox(width: 10,height: 10),
              Column(children: <Widget>[
              ShortWidget(inputText:'簡單型-大人' ,day: '2021/09/30',number: '1',),SizedBox(width: 10,height: 10),
              ShortWidget(inputText:'簡單型-小孩' ,day: '2021/09/30',number: '1',),SizedBox(width: 10,height: 10),
              ShortWidget(inputText:'非再吸入型-大人' ,day: '2021/09/30',number: '1',),SizedBox(width: 10,height: 10),
              ShortWidget(inputText:'非再吸入型-小孩' ,day: '2021/09/30',number: '1',),
              ],)
              
                ] ,) ,
                SizedBox(width: 10,height: 10),
              //抽吸導管
             Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:<Widget>[        
                  Container(width: 30,height: 130,decoration:BoxDecoration(borderRadius:BorderRadius.circular(10),color:Color.fromRGBO(155, 164, 180, 1)  ) , 
                  child:Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
              children:<Widget> [
                SizedBox(width: 10,height: 20),
              Container(child:
              Text( '抽',textAlign:TextAlign.center,style: TextStyle(color: Color.fromRGBO(255, 255, 255, 1),fontSize:16 ))),
              Container(child:
              Text('吸',textAlign:TextAlign.center,style: TextStyle( color: Color.fromRGBO(255, 255, 255, 1),fontSize:16 ))),
              Container(child:
              Text('導',textAlign:TextAlign.center,style: TextStyle(color: Color.fromRGBO(255, 255, 255, 1),fontSize:16 ))),
              Container(child:
              Text('管',textAlign:TextAlign.center,style: TextStyle( color: Color.fromRGBO(255, 255, 255, 1),fontSize:16 ))),
              ],),
               ),
               SizedBox(width: 10,height: 10),
              Column(children: <Widget>[
              ShortWidget(inputText:'8號' ,day: '2021/09/30',number: '1',),SizedBox(width: 10,height: 10),
              ShortWidget(inputText:'14號' ,day: '2021/09/30',number: '1',),
              ],)
                ] ,) ,
                 SizedBox(width: 10,height: 10),
              LongWidget(inputText:'可攜帶式抽吸器',day:'2021/08/31',number:'1'),
               SizedBox(width: 10,height: 10),
              LongWidget(inputText:'手持式血氧濃度分析儀',day:'2021/08/31',number:'1'),
               SizedBox(width: 10,height: 10),
              LongWidget(inputText:'可摺疊式搬運椅/椅式擔架',day:'2021/08/31',number:'1'),
               SizedBox(width: 10,height: 10),
              LongWidget(inputText:'長背板',day:'2021/08/31',number:'1'),
               SizedBox(width: 10,height: 10),
              LongWidget(inputText:'含固定帶之配件',day:'2021/08/31',number:'1'),
               SizedBox(width: 10,height: 10),
              LongWidget(inputText:'軀幹固定器',day:'2021/08/31',number:'1'),
               SizedBox(width: 10,height: 10),
              LongWidget(inputText:'投頸部固定器',day:'2021/08/31',number:'1'),
               SizedBox(width: 10,height: 10),
               Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:<Widget>[        
                  Container(width: 30,height: 200,decoration:BoxDecoration(borderRadius:BorderRadius.circular(10),color:Color.fromRGBO(155, 164, 180, 1)  ) , 
                  child:Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
              children:<Widget> [
                SizedBox(width: 10,height: 30),
              Container(child:
              Text( '可',textAlign:TextAlign.center,style: TextStyle(color: Color.fromRGBO(255, 255, 255, 1),fontSize:16 ))),
              Container(child:
              Text('拋',textAlign:TextAlign.center,style: TextStyle( color: Color.fromRGBO(255, 255, 255, 1),fontSize:16 ))),
              Container(child:
              Text('棄',textAlign:TextAlign.center,style: TextStyle(color: Color.fromRGBO(255, 255, 255, 1),fontSize:16 ))),
              Container(child:
              Text('式',textAlign:TextAlign.center,style: TextStyle( color: Color.fromRGBO(255, 255, 255, 1),fontSize:16 ))),
              Container(child:
              Text('頸',textAlign:TextAlign.center,style: TextStyle(color: Color.fromRGBO(255, 255, 255, 1),fontSize:16 ))),
              Container(child:
              Text('圈',textAlign:TextAlign.center,style: TextStyle(color: Color.fromRGBO(255, 255, 255, 1),fontSize:16 ))),
              ],),
               ),
               SizedBox(width: 10,height: 10),
              Column(children: <Widget>[
              ShortWidget(inputText:'大' ,day: '2021/09/30',number: '1',),SizedBox(width: 10,height: 10),
              ShortWidget(inputText:'中' ,day: '2021/09/30',number: '1',),SizedBox(width: 10,height: 10),
              ShortWidget(inputText:'小' ,day: '2021/09/30',number: '1',),
              ],)
                ] ,) ,
              SizedBox(width: 10,height: 10),
              LongWidget(inputText:'固定四肢用護木',day:'2021/08/31',number:'1'),
               SizedBox(width: 10,height: 10),
              LongWidget(inputText:'保護固定帶',day:'2021/08/31',number:'1'),
               SizedBox(width: 10,height: 10),
              LongWidget(inputText:'一般急救箱',day:'2021/08/31',number:'1'),
               SizedBox(width: 10,height: 10),
              LongWidget(inputText:'可丟棄式手套',day:'2021/08/31',number:'1'),
               SizedBox(width: 10,height: 10),
              LongWidget(inputText:'毛毯被單',day:'2021/08/31',number:'1'),
               SizedBox(width: 10,height: 10),
              LongWidget(inputText:'滅火器',day:'2021/08/31',number:'1'),
               SizedBox(width: 10,height: 30),
              ],),
            
          )
);

        
        }
        }