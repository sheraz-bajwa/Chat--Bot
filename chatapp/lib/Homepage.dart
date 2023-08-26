import 'dart:async';
import 'package:chatapp/Chat.dart';
import 'package:flutter/material.dart';
import 'package:chat_gpt_sdk/chat_gpt_sdk.dart';
import 'package:chat_gpt_sdk/chat_gpt_sdk.dart';

class ChatBot extends StatefulWidget {
  const ChatBot({super.key});

  @override
  State<ChatBot> createState() => _ChatBotState();
}

class _ChatBotState extends State<ChatBot> {
  TextEditingController _countryController = TextEditingController();

  final List<ChatMessages> messages = [];
  //late OpenAI chatGpt;
  StreamSubscription? subscription;
  // final apiKey = "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";

  var openAI = OpenAI.instance.build(
      token: "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",
      baseOption: HttpSetup(receiveTimeout: const Duration(seconds: 300)),
      enableLog: true);
  //OpenAI? openAI;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    openAI = OpenAI.instance;
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    subscription?.cancel();
  }

//new
// api key= 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
  Future<void> _sendMessage() async {
    ChatMessages newMessage =
        ChatMessages(text: _countryController.text, sender: 'User');

    setState(() {
      messages.insert(0,
          newMessage); // Insert at the beginning of the list to show new messages at the bottom.
    });

    _countryController.clear();
    final request = CompleteText(
        prompt: newMessage.text, model: TextDavinci3Model(), maxTokens: 200);

    final response = await openAI.onCompletion(request: request);
    print(response!.choices[0].text);
  }

  Widget _textcomposer() {
    return Row(
      children: [
        Expanded(
          child: TextField(
              onSubmitted: (value) => _sendMessage(),
              controller: _countryController,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(
                      width: 1, color: Color.fromARGB(255, 194, 199, 206)),
                ),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(
                        width: 1, color: Color.fromARGB(255, 34, 86, 163))),
                hintText: 'Enter Text',
                hintStyle: TextStyle(color: Colors.black),
              )),
        ),
        IconButton(
          onPressed: () {
            _sendMessage();
          },
          icon: Icon(Icons.send),
          //color: Colors.amber,
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('ChatBOt'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
                child: ListView.builder(
                    reverse: true,
                    itemCount: messages.length,
                    itemBuilder: (context, index) {
                      return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: messages[index]);
                    })),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(),
                child: _textcomposer(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
