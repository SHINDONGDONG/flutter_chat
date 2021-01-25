import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatMessage extends StatelessWidget {
  final String txt;                          //넘어오는 텍스트를 받는 변수
  final Animation<double> animation;
  const ChatMessage( this.txt,@required this.animation,{Key key,}) : super(key: key);  //생성자로 만들어 변수를 받는다.
  @override
  Widget build(BuildContext context) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 8),
        child: FadeTransition(   //페이드 트랜시션 (옅은 -> 진한)으로 나타남
          opacity: animation,
          child: SizeTransition(             //사이즈 트랜시션 위젯으로 감싼후 (로우를)
            sizeFactor: animation,        //받아온 애니메이션을 사이즈팩터에 넣어줌
            axisAlignment: -1.0, // -1.0 아래서부터, 0.0 위에서부터
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
          ),
        ),
      );
  }
}
