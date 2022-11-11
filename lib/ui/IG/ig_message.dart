import 'package:all_is_here/ui/IG/list_message.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class IGMessage extends StatefulWidget {
  const IGMessage({super.key});

  @override
  State<IGMessage> createState() => _IGMessageState();
}

class _IGMessageState extends State<IGMessage> {
  TextEditingController username = TextEditingController();
  TextEditingController nickname = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: username,
              decoration: InputDecoration(
                hintText: "Username",
              ),
            ),
            TextField(
              controller: nickname,
              decoration: InputDecoration(
                hintText: "nickname",
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ListMessage(
                      your_username: username.text,
                      your_nickname: nickname.text,
                    ),
                  ),
                );
              },
              child: Text("Next"),
            ),
          ],
        ),
      ),
    );
  }
}
