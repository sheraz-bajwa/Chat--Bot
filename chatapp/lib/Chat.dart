import 'package:flutter/material.dart';

class ChatMessages extends StatelessWidget {
  const ChatMessages(
      {super.key, required this.text, required this.sender, required this.img});

  final String text;
  final String sender;
  final String img;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          margin: EdgeInsets.only(right: 20),
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
            ListTile(
              shape: RoundedRectangleBorder(
                side: BorderSide(
                  color: Colors.purple,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              title: Text(
                sender,
                style: TextStyle(
                  fontSize: 15,
                ),
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
                        fontSize: 15,
                      ),
                    ),
                  ),
                ],
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
