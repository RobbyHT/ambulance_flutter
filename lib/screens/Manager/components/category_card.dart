import 'package:flutter/material.dart';


//方框按鈕參照
class CategoryCard extends StatelessWidget {
  final IconData iconSrc;
  final String title;
  final Function press;
  const CategoryCard({
    Key key,
    this.iconSrc,
    this.title,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 30),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(13), //按鈕圓角
        boxShadow: [ //按鈕陰影
            BoxShadow( 
              offset: Offset(0, 17), //延伸陰影:向右下的距離((x,y)
              blurRadius: 10, //模糊程度
              spreadRadius: -10, //擴散程度
              color: Color(0xFFE6E6E6),
            ),
          ],
      ),
      child: Material(
        color: Colors.transparent, //設定點擊時的顏色
        child: InkWell( //給任意Widget添加點擊事件
          onTap: press,
          child: Column(
            children: <Widget>[
              IconButton(
                icon: Icon(iconSrc),
                // icon: Icon(Icons.people),
                // tooltip: 'people',
                onPressed: press,
                iconSize: 70,
                padding: EdgeInsets.only(left: 20,top:40,right: 20,bottom: 10),
              ),
              Text(
                title,
                style: Theme.of(context).textTheme.title,
              ),
            ],
          ),
        ),
      )
    );
  }
}
