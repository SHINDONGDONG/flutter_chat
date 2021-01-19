import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {                  //항상 변화하는 채팅앱이기때문에
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text('Chat App'),
          ),
          body: Container(
            padding: EdgeInsets.symmetric(horizontal: 8.0),               //호리존탈 가로길이
            child: Row(
              children: [
                Expanded(
                  child: TextField(                                     //텍스트필드 쓰면 텍스트랑 키보드나옴
                    decoration: InputDecoration(
                    hintText: '메세지를 입력해주세요',
                  ),
                    keyboardType: TextInputType.text,
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(width: 8.0,),
                FlatButton(onPressed: () {

                }, child: Text('Send'),
                color: Colors.amberAccent,)
              ],
            ),
          ),

        ),
      ),
    );
  }
}
