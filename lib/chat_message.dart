import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatMessage extends StatelessWidget {
  final String txt;                          //넘어오는 텍스트를 받는 변수
  const ChatMessage( this.txt,{Key key,}) : super(key: key);  //생성자로 만들어 변수를 받는다.
  @override
  Widget build(BuildContext context) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 8),
        child: Row(
          children: [
            CircleAvatar(
              backgroundColor: Colors.amberAccent,
              child: Text('N'),
            ),
            SizedBox(width: 16,),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('ID or Name',style: TextStyle(fontWeight: FontWeight.bold),),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: Container(
                      margin: EdgeInsets.only(right: 8),
                      padding: EdgeInsets.only(left: 5,top: 3),
                      width: MediaQuery.of(context).size.width,
                      height: 30,
                      child: Text(txt),
                      color: Colors.grey[300],
                    ),
                  ),
                ],
              ),
            ),
            Column(

            )
          ],
        ),
      );
  }
}
