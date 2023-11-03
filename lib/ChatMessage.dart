class ChatMessage {
  final String text;
  final bool isUserMessage;

  ChatMessage({
    required this.text,
    required this.isUserMessage,
  });
}

void main() {
  List<ChatMessage> chatMessages = [];

  // Kullanıcı mesajı ekleme
  String userMessage = 'Merhaba';
  chatMessages.add(ChatMessage(
    text: userMessage,
    isUserMessage: true,
  ));

  // AI Asistanının yanıtını ekleme
  String assistantMessage = 'Merhaba! Size nasıl yardımcı olabilirim?';
  chatMessages.add(ChatMessage(
    text: assistantMessage,
    isUserMessage: false,
  ));


  // Sohbet mesajlarını listeleme
  for (var message in chatMessages) {
    String messageType = message.isUserMessage ? 'Kullanıcı: ' : 'AI Asistanı: ';
    print(messageType + message.text);
  }
}