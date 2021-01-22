import 'package:flutter/material.dart';
import 'package:flutter_chat/chat_message.dart';
import 'package:logger/logger.dart';

class HomePage extends StatefulWidget {
  //항상 변화하는 채팅앱이기때문에
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController _textEditingController = TextEditingController();
  List<String> _textList =[];
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
          body: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return ChatMessage(_textList[index]);             //입력한 textController를 리스트에 담아서 출력한다.
                  },
                  itemCount: _textList.length,                     //메세지 배열에 들어간 수 만큼 채팅 개수를 늘림.


/*                  children: [
                    ChatMessage("Testing Message"),
                    ChatMessage("2번째 메세지"),*/

                  // ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8.0), //호리존탈 가로길이
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        //텍스트필드 쓰면 텍스트랑 키보드나옴
                        controller: _textEditingController,
                        //텍스트필드에 들어가있는 텍스트를 플랫버튼을 누르면 print하게
                        onSubmitted: _handleSubmitted, //Keyboard 판에서 ok를 눌렀을때도 데이터를 보낸다
                        decoration: InputDecoration(
                          hintText: '메세지를 입력해주세요',
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(
                      width: 8.0,
                    ),
                    FlatButton(
                      onPressed: () {
                        // print(_textEditingController.text);
                        this._textList.add(_textEditingController.text);
                        print(_textList);
                        _handleSubmitted(_textEditingController.text);
                      },
                      child: Text('Send'),
                      color: Colors.amberAccent,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }



  void _handleSubmitted(String text) {
    var logger =Logger();
    logger.d(text);
    logger.e(text);
    _textEditingController.clear();               //텍스트에디터를 클리어해주어 없애준다.

  }
}
