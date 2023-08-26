import 'package:flutter/material.dart';

class ChatMessages extends StatelessWidget {
  const ChatMessages({super.key, required this.text, required this.sender});

  final String text;
  final String sender;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          margin: EdgeInsets.only(right: 20),
          child: CircleAvatar(
            backgroundColor: Colors.blue,
            child: Center(
              child: Text(
                'U',
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              sender,
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.w900),
            ),
            Text(
              text,
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
            )
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
