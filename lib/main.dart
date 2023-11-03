import 'package:flutter/material.dart';
import 'package:new1/AIAssistant.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AI Assistant',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        primarySwatch: Colors.blueGrey,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: AIAssistantPage(),
    );
  }
}

class AIAssistantPage extends StatefulWidget {
  @override
  _AIAssistantPageState createState() => _AIAssistantPageState();
}

class _AIAssistantPageState extends State<AIAssistantPage> {
  TextEditingController _inputController = TextEditingController();
  List<ChatMessage> _chatMessages = [];

  @override
  void dispose() {
    _inputController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fırat-GPT APP'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(16),
              child: ListView.builder(
                reverse: true,
                itemCount: _chatMessages.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.symmetric(vertical: 6),
                    decoration: BoxDecoration(
                      color: _chatMessages[index].isUserMessage
                          ? Colors.lightBlue
                          : Colors.black26,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: ListTile(
                      title: Text(
                        _chatMessages[index].text,
                        textAlign: _chatMessages[index].isUserMessage
                            ? TextAlign.right
                            : TextAlign.left,
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _inputController,
                    decoration: InputDecoration(
                      hintText: 'Bir mesaj yazın...',
                    ),
                  ),
                ),
                SizedBox(width: 36),
                ElevatedButton(
                  onPressed: () {
                    final message = _inputController.text;
                    _inputController.clear();
                    _sendMessage(message);
                  },
                  child: Text('Gönder'),
                ),
                SizedBox(width: 8),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _chatMessages.clear();
                    });
                  },
                  child: Text('Temizle'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _sendMessage(String message) {
    if (message.isNotEmpty) {
      setState(() {
        _chatMessages.insert(
          0,
          ChatMessage(
            text: message,
            isUserMessage: true,
          ),
        );
      });

      final response = AIAssistant().getResponse(message);

      setState(() {
        _chatMessages.insert(
          0,
          ChatMessage(
            text: response,
            isUserMessage: false,
          ),
        );
      });
    }
  }
}

class ChatMessage {
  final String text;
  final bool isUserMessage;

  ChatMessage({required this.text, required this.isUserMessage});
}