        import 'package:ambulance_flutter/screens/equipmentUI/components/longbtn.dart';
import 'package:ambulance_flutter/screens/equipmentUI/components/shortbtn.dart';
import 'package:flutter/material.dart';

class BoxWidget extends StatefulWidget {
        @override
        _BoxWidgetState createState() => _BoxWidgetState();
        }
        
        class _BoxWidgetState extends State<BoxWidget> {
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
          backgroundColor: (Color.fromRGBO(20,39,78,1))  ,
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
              child: Text('急救箱配備',textAlign:TextAlign.center,style: TextStyle(
            color: Color.fromRGBO(255, 255, 255, 1),
            fontSize: 20),)
              ),
              ) ,
              
              SizedBox(width: 10,height: 20),
              LongWidget(inputText:'無菌手套',day:'2021/08/31',number:'4'),
              SizedBox(width: 10,height: 10),
              LongWidget(inputText:'酒精棉片',day:'2021/08/31',number:'10'),
              SizedBox(width: 10,height: 10),
              LongWidget(inputText:'彎盆',day:'2021/08/31',number:'1'),
              SizedBox(width: 10,height: 10),
              //垃圾袋
             Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:<Widget>[        
                  Container(width: 30,height: 130,decoration:BoxDecoration(borderRadius:BorderRadius.circular(10),color:Color.fromRGBO(155, 164, 180, 1)  ) , 
                  child:Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
              children:<Widget> [
                SizedBox(width: 10,height: 25),
              Container(child:
              Text( '垃',textAlign:TextAlign.center,style: TextStyle(color: Color.fromRGBO(255, 255, 255, 1),fontSize:16 ))),
              Container(child:
              Text('圾',textAlign:TextAlign.center,style: TextStyle( color: Color.fromRGBO(255, 255, 255, 1),fontSize:16 ))),
              Container(child:
              Text('袋',textAlign:TextAlign.center,style: TextStyle(color: Color.fromRGBO(255, 255, 255, 1),fontSize:16 ))),
              ],),
               ),
               SizedBox(width: 10,height: 10),
              Column(children: <Widget>[
              ShortWidget(inputText:'一般性' ,day: '2021/09/30',number: '1',),SizedBox(width: 10,height: 10),
              ShortWidget(inputText:'感染性' ,day: '2021/09/30',number: '1',),
              ],)
               ] ,) ,
              SizedBox(width: 10,height: 10),
              LongWidget(inputText:'生理食鹽水(500ml)',day:'2021/08/31',number:'1'),
              SizedBox(width: 10,height: 10),
              LongWidget(inputText:'人工甦醒球',day:'2021/08/31',number:'1'),
              SizedBox(width: 10,height: 10),
              LongWidget(inputText:'體溫測量器',day:'2021/08/31',number:'1'),
              SizedBox(width: 10,height: 10),
              LongWidget(inputText:'寬膠帶',day:'2021/08/31',number:'1'),
              SizedBox(width: 10,height: 10),
              LongWidget(inputText:'紙膠',day:'2021/08/31',number:'1'),
              SizedBox(width: 10,height: 10),
              LongWidget(inputText:'止血帶',day:'2021/08/31',number:'2'),
              SizedBox(width: 10,height: 10),
              LongWidget(inputText:'剪刀',day:'2021/08/31',number:'1'),
              SizedBox(width: 10,height: 10),
              LongWidget(inputText:'優點棉片/優點液',day:'2021/08/31',number:'1'),
              SizedBox(width: 10,height: 10),
              LongWidget(inputText:'護目鏡',day:'2021/08/31',number:'1'),
              SizedBox(width: 10,height: 10),
              LongWidget(inputText:'外科口罩',day:'2021/08/31',number:'1'),
              SizedBox(width: 10,height: 10),
              //鑷子
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:<Widget>[        
                  Container(width: 30,height: 130,decoration:BoxDecoration(borderRadius:BorderRadius.circular(10),color:Color.fromRGBO(155, 164, 180, 1)  ) , 
                  child:Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
              children:<Widget> [
                SizedBox(width: 10,height: 40),
              Container(child:
              Text( '鑷',textAlign:TextAlign.center,style: TextStyle(color: Color.fromRGBO(255, 255, 255, 1),fontSize:16 ))),
              Container(child:
              Text('子',textAlign:TextAlign.center,style: TextStyle( color: Color.fromRGBO(255, 255, 255, 1),fontSize:16 ))),
              
              ],),
               ),
               SizedBox(width: 10,height: 10),
              Column(children: <Widget>[
              ShortWidget(inputText:'有齒' ,day: '2021/09/30',number: '1',),SizedBox(width: 10,height: 10),
              ShortWidget(inputText:'無齒' ,day: '2021/09/30',number: '1',),
              ],)
               ] ,) ,
               SizedBox(width: 10,height: 10),
              //棉棒
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:<Widget>[        
                  Container(width: 30,height: 200,decoration:BoxDecoration(borderRadius:BorderRadius.circular(10),color:Color.fromRGBO(155, 164, 180, 1)  ) , 
                  child:Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
              children:<Widget> [
                SizedBox(width: 10,height: 70),
              Container(child:
              Text( '棉',textAlign:TextAlign.center,style: TextStyle(color: Color.fromRGBO(255, 255, 255, 1),fontSize:16 ))),
              Container(child:
              Text('棒',textAlign:TextAlign.center,style: TextStyle( color: Color.fromRGBO(255, 255, 255, 1),fontSize:16 ))),
              
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
               //紗布
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:<Widget>[        
                  Container(width: 30,height: 200,decoration:BoxDecoration(borderRadius:BorderRadius.circular(10),color:Color.fromRGBO(155, 164, 180, 1)  ) , 
                  child:Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
              children:<Widget> [
                SizedBox(width: 10,height: 70),
              Container(child:
              Text( '紗',textAlign:TextAlign.center,style: TextStyle(color: Color.fromRGBO(255, 255, 255, 1),fontSize:16 ))),
              Container(child:
              Text('布',textAlign:TextAlign.center,style: TextStyle( color: Color.fromRGBO(255, 255, 255, 1),fontSize:16 ))),
              
              ],),
               ),
               SizedBox(width: 10,height: 10),
              Column(children: <Widget>[
              ShortWidget(inputText:'2*2' ,day: '2021/09/30',number: '1',),SizedBox(width: 10,height: 10),
              ShortWidget(inputText:'3*3' ,day: '2021/09/30',number: '1',),SizedBox(width: 10,height: 10),
              ShortWidget(inputText:'4*4' ,day: '2021/09/30',number: '1',),
              ],)
               ] ,) ,
               SizedBox(width: 10,height: 10),
              LongWidget(inputText:'壓舌板',day:'2021/08/31',number:'1'),
              SizedBox(width: 10,height: 10),
              //咬合器
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:<Widget>[        
                  Container(width: 30,height: 130,decoration:BoxDecoration(borderRadius:BorderRadius.circular(10),color:Color.fromRGBO(155, 164, 180, 1)  ) , 
                  child:Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
              children:<Widget> [
                SizedBox(width: 10,height: 25),
              Container(child:
              Text( '咬',textAlign:TextAlign.center,style: TextStyle(color: Color.fromRGBO(255, 255, 255, 1),fontSize:16 ))),
              Container(child:
              Text('合',textAlign:TextAlign.center,style: TextStyle( color: Color.fromRGBO(255, 255, 255, 1),fontSize:16 ))),
              Container(child:
              Text('器',textAlign:TextAlign.center,style: TextStyle( color: Color.fromRGBO(255, 255, 255, 1),fontSize:16 ))),              
              ],),
               ),
               SizedBox(width: 10,height: 10),
              Column(children: <Widget>[
              ShortWidget(inputText:'7cm' ,day: '2021/09/30',number: '1',),SizedBox(width: 10,height: 10),
              ShortWidget(inputText:'5cm' ,day: '2021/09/30',number: '1',),
              ],)
               ] ,) ,
               SizedBox(width: 10,height: 10),
              LongWidget(inputText:'口呼吸道(含各大小型5種以上)',day:'2021/08/31',number:'1'),
               SizedBox(width: 10,height: 10),
               //鼻咽呼吸道
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:<Widget>[        
                  Container(width: 30,height: 340,decoration:BoxDecoration(borderRadius:BorderRadius.circular(10),color:Color.fromRGBO(155, 164, 180, 1)  ) , 
                  child:Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
              children:<Widget> [
                SizedBox(width: 10,height: 100),
              Container(child:
              Text( '鼻',textAlign:TextAlign.center,style: TextStyle(color: Color.fromRGBO(255, 255, 255, 1),fontSize:16 ))),
              Container(child:
              Text('咽',textAlign:TextAlign.center,style: TextStyle( color: Color.fromRGBO(255, 255, 255, 1),fontSize:16 ))),
              Container(child:
              Text('呼',textAlign:TextAlign.center,style: TextStyle( color: Color.fromRGBO(255, 255, 255, 1),fontSize:16 ))), 
              Container(child:
              Text( '吸',textAlign:TextAlign.center,style: TextStyle(color: Color.fromRGBO(255, 255, 255, 1),fontSize:16 ))),
              Container(child:
              Text('道',textAlign:TextAlign.center,style: TextStyle( color: Color.fromRGBO(255, 255, 255, 1),fontSize:16 ))),
              ],),
               ),
               SizedBox(width: 10,height: 10),
              Column(children: <Widget>[
              ShortWidget(inputText:'6.0號' ,day: '2021/09/30',number: '1',),SizedBox(width: 10,height: 10),
              ShortWidget(inputText:'6.5號' ,day: '2021/09/30',number: '1',),SizedBox(width: 10,height: 10),
              ShortWidget(inputText:'7.0號' ,day: '2021/09/30',number: '1',),SizedBox(width: 10,height: 10),
              ShortWidget(inputText:'7.5號' ,day: '2021/09/30',number: '1',),SizedBox(width: 10,height: 10),
              ShortWidget(inputText:'8.0號' ,day: '2021/09/30',number: '1',),
              ],)
               ] ,) ,
              SizedBox(width: 10,height: 10),
              LongWidget(inputText:'瞳孔筆及其備用電源',day:'2021/08/31',number:'1'),
              SizedBox(width: 10,height: 10),
              LongWidget(inputText:'驅血帶(靜脈注射用)',day:'2021/08/31',number:'1'),
              SizedBox(width: 10,height: 10),
              LongWidget(inputText:'血壓計',day:'2021/08/31',number:'1'),
              SizedBox(width: 10,height: 10),
              LongWidget(inputText:'聽診器',day:'2021/08/31',number:'1'),
              SizedBox(width: 10,height: 10),
              //彈性紗繃
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:<Widget>[        
                  Container(width: 30,height: 200,decoration:BoxDecoration(borderRadius:BorderRadius.circular(10),color:Color.fromRGBO(155, 164, 180, 1)  ) , 
                  child:Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
              children:<Widget> [
                SizedBox(width: 10,height: 50),
              Container(child:
              Text( '彈',textAlign:TextAlign.center,style: TextStyle(color: Color.fromRGBO(255, 255, 255, 1),fontSize:16 ))),
              Container(child:
              Text('性',textAlign:TextAlign.center,style: TextStyle( color: Color.fromRGBO(255, 255, 255, 1),fontSize:16 ))),
              Container(child:
              Text( '紗',textAlign:TextAlign.center,style: TextStyle(color: Color.fromRGBO(255, 255, 255, 1),fontSize:16 ))),
              Container(child:
              Text( '繃',textAlign:TextAlign.center,style: TextStyle(color: Color.fromRGBO(255, 255, 255, 1),fontSize:16 ))),
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
              LongWidget(inputText:'彈性繃帶',day:'2021/08/31',number:'1'),
              SizedBox(width: 10,height: 10),
              LongWidget(inputText:'三角巾',day:'2021/08/31',number:'5'),
              SizedBox(width: 10,height: 30),

            
              ],),
            
          )
);

        
        }
        }