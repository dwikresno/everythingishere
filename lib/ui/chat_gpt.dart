import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ChatGPT extends StatefulWidget {
  const ChatGPT({super.key});

  @override
  State<ChatGPT> createState() => _ChatGPTState();
}

class _ChatGPTState extends State<ChatGPT> {
// Replace YOUR_API_KEY with your actual API key
  final apiKey = 'YOUR_API_KEY';

// The model that you want to use
  final model = 'text-davinci-003';

  //list chat
  List<ChatModel> listChat = [];
  TextEditingController chatController = TextEditingController();

  getData(order) async {
    try {
      final response = await http.post(
        Uri.parse('https://api.openai.com/v1/completions'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $apiKey',
        },
        body: jsonEncode({
          "prompt": order,
          "model": model,
          "max_tokens": 50,
        }),
      );
      print(response.request);
      ChatGPTModel chatGPTModel =
          ChatGPTModel.fromJson(jsonDecode(response.body));
      setState(() {
        listChat.add(
          ChatModel(
            id: DateTime.now().millisecond,
            isMe: false,
            chat: chatGPTModel.choices!.last.text!,
          ),
        );
      });
    } catch (e, stacktrace) {
      print(stacktrace);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff444654),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              reverse: true,
              itemCount: listChat.reversed.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  color: !listChat.reversed.elementAt(index).isMe!
                      ? Colors.transparent
                      : Color(0xff343541),
                  padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                  child: Text(
                    listChat.reversed.elementAt(index).chat!,
                    style: TextStyle(color: Colors.white),
                  ),
                );
              },
            ),
          ),
          SizedBox(
            height: 70,
          )
        ],
      ),
      bottomSheet: Wrap(
        children: [
          Container(
            color: Color(0xff40414f),
            padding: EdgeInsets.all(10),
            // height: 40,
            child: Row(
              children: [
                Expanded(
                  child: TextFormField(
                    style: TextStyle(
                      color: Colors.white,
                    ),
                    controller: chatController,
                    onChanged: (value) {},
                    maxLines: 5,
                    minLines: 1,
                  ),
                ),
                SizedBox(width: 10),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      if (chatController.text.isNotEmpty) {
                        listChat.add(
                          ChatModel(
                            id: DateTime.now().millisecond,
                            isMe: true,
                            chat: chatController.text,
                          ),
                        );
                        getData(chatController.text);
                        chatController.clear();
                      }
                    });
                  },
                  child: Icon(
                    Icons.send,
                    color: Color(0xff8e8ea0),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class ChatModel {
  int? id;
  bool? isMe;
  String? chat;

  ChatModel({this.id, this.isMe, this.chat});

  ChatModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    isMe = json['isMe'];
    chat = json['chat'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['isMe'] = this.isMe;
    data['chat'] = this.chat;
    return data;
  }
}

class ChatGPTModel {
  String? id;
  String? object;
  int? created;
  String? model;
  List<Choices>? choices;
  Usage? usage;

  ChatGPTModel(
      {this.id,
      this.object,
      this.created,
      this.model,
      this.choices,
      this.usage});

  ChatGPTModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    object = json['object'];
    created = json['created'];
    model = json['model'];
    if (json['choices'] != null) {
      choices = <Choices>[];
      json['choices'].forEach((v) {
        choices!.add(new Choices.fromJson(v));
      });
    }
    usage = json['usage'] != null ? new Usage.fromJson(json['usage']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['object'] = this.object;
    data['created'] = this.created;
    data['model'] = this.model;
    if (this.choices != null) {
      data['choices'] = this.choices!.map((v) => v.toJson()).toList();
    }
    if (this.usage != null) {
      data['usage'] = this.usage!.toJson();
    }
    return data;
  }
}

class Choices {
  String? text;
  int? index;
  String? logprobs;
  String? finishReason;

  Choices({this.text, this.index, this.logprobs, this.finishReason});

  Choices.fromJson(Map<String, dynamic> json) {
    text = json['text'];
    index = json['index'];
    logprobs = json['logprobs'];
    finishReason = json['finish_reason'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['text'] = this.text;
    data['index'] = this.index;
    data['logprobs'] = this.logprobs;
    data['finish_reason'] = this.finishReason;
    return data;
  }
}

class Usage {
  int? promptTokens;
  int? completionTokens;
  int? totalTokens;

  Usage({this.promptTokens, this.completionTokens, this.totalTokens});

  Usage.fromJson(Map<String, dynamic> json) {
    promptTokens = json['prompt_tokens'];
    completionTokens = json['completion_tokens'];
    totalTokens = json['total_tokens'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['prompt_tokens'] = this.promptTokens;
    data['completion_tokens'] = this.completionTokens;
    data['total_tokens'] = this.totalTokens;
    return data;
  }
}
