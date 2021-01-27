import 'dart:io';

import 'package:flutter/cupertino.dart';
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
  List<String> _chats = []; // 메세지를 담을 수 있는 전용 클래스
  GlobalKey<AnimatedListState> _animListKey =
      GlobalKey<AnimatedListState>(); //애니메이트 상태를 가지고있다
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: SafeArea(
        child: Scaffold(
          appBar: Platform.isIOS
              ? //현재 플랫폼이 IOS이면 쿠퍼티노 네비게이션바로 표현
              CupertinoNavigationBar(
                  middle: Text('Chat App IOS'),
                )
              : AppBar(
                  title: Text('Chat App'),
                ),
          body: Column(
            children: [
              Expanded(
                child: AnimatedList(
                  key: _animListKey,
                  itemBuilder: _buildItem,
                  // initialItemCount: _chats.length,
                  // child: ListView.builder(
                  reverse: true, //채팅이 아래에서부터 위로 올라온다.
                  // itemBuilder: (context, index) {
                  //   return _chats[index];             //입력한 textController를 리스트에 담아서 출력한다.
                  // },
                  // itemCount: _chats.length,                     //메세지 배열에 들어간 수 만큼 채팅 개수를 늘림.
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
                      child: Platform.isIOS
                          ? CupertinoTextField(
                              //텍스트필드 쓰면 텍스트랑 키보드나옴
                              controller: _textEditingController,
                              //텍스트필드에 들어가있는 텍스트를 플랫버튼을 누르면 print하게
                              onSubmitted: _handleSubmitted,
                              //Keyboard 판에서 ok를 눌렀을때도 데이터를 보낸다
                              placeholder: '메세지를 입력해주세요',
                              textAlign: TextAlign.center,
                            )
                          : TextField(
                              //텍스트필드 쓰면 텍스트랑 키보드나옴
                              controller: _textEditingController,
                              //텍스트필드에 들어가있는 텍스트를 플랫버튼을 누르면 print하게
                              onSubmitted: _handleSubmitted,
                              //Keyboard 판에서 ok를 눌렀을때도 데이터를 보낸다
                              decoration: InputDecoration(
                                hintText: '메세지를 입력해주세요',
                              ),
                              textAlign: TextAlign.center,
                            ),
                    ),
                    SizedBox(
                      width: 8.0,
                    ),
                    Platform.isIOS//현재 플랫폼이 IOS이면 쿠퍼티노
                        ? CupertinoButton(
                            child: Text("send"),
                            onPressed: () {
                              if(_textEditingController.text.isEmpty){
                                return;
                              }else{
                              _handleSubmitted(_textEditingController.text);
                              }
                            },
                          )
                        : IconButton(
                            onPressed: () {
                              // print(_textEditingController.text);
                              print(_chats);
                              if(!_textEditingController.text.isEmpty){
                              _handleSubmitted(_textEditingController.text);
                              }
                            },
                            icon: Icon(Icons.send),
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

  Widget _buildItem(context, index, animation) {
    return ChatMessage(_chats[index], animation);
  }

  void _handleSubmitted(String text) {
    var logger = Logger();
    _textEditingController.clear(); //텍스트에디터를 클리어해주어 없애준다.
    _chats.insert(0, text);
    _animListKey.currentState
        .insertItem(0); //animate 키의 . 현재상태를 . insertitem 에 0번째 인덱스에 넣어준다라고 알려줌
    // setState(() {
    // _chats.insert(0,newChat);
    // });
  }
}
