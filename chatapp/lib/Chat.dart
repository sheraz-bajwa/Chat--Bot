import 'package:flutter/material.dart';
import 'dart:math';

class ChatMessages extends StatelessWidget {
  const ChatMessages({
    super.key,
    required this.text,
    required this.sender,
    required this.img,
    required this.color,
  });

  final String text;
  final String sender;
  final String img;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          margin: EdgeInsets.only(right: 10),
          child: CircleAvatar(
              backgroundColor: Colors.blue,
              child: Image.asset(
                img,
                fit: BoxFit.cover,
              )),
        ),
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(20),
                // gradient: LinearGradient(
                //   colors: [
                //     Colors.blue,
                //     Color.fromARGB(255, 0, 107, 156),
                //   ],
                //   begin: Alignment.topCenter,
                //   end: Alignment.bottomCenter,
                // ),
              ),
              child: ListTile(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                title: Text(
                  sender,
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w900,
                      color: Colors.black),
                ),
                subtitle: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 200,
                      child: Text(
                        text,
                        softWrap: true,
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.black),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ))
      ],
    );
  }
}
    // final request = CompleteText(
    //     prompt: newMessage.text, maxTokens: 200, model: TextDavinci3Model());

    // subscription = chatGPT!
    //     .build(
    //         token: "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",
    //         orgId: " ",
    //         enableLog: false)
    //     .onCompletionSSE(request: request)
    //     .listen((response) {

    //   ChatMessages Botmessage = ChatMessages(
    //     text: response.choices[0].text,
    //     sender: "Bot",
    //   );
    //   setState(() {
    //     messages.insert(0, Botmessage);
    //   });
    // });
    //final request = CompleteText(prompt:newMessage.text, model: TextDavinci3Model(), maxTokens: 200);
