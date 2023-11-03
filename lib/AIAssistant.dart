// AIAssistant sınıfı
class AIAssistant {
  String getResponse(String message) {
    // Sorulara cevap verecek yapay zeka kodu buraya gelecek
    // Örneğin:
    if (message.toLowerCase() == 'merhaba') {
      return 'Merhaba, size nasıl yardımcı olabilirim?';
    } else if (message.toLowerCase() == 'java nedir?') {
      return 'Java, hem bir programlama dilidir hem de bir platformdur. Nesne yönelimli bir dil olup geniş bir kullanıcı tabanına sahiptir.';
    } else
    if (message.toLowerCase() == 'Java garbage collector ne işe yarar?') {
      return 'Java garbage collector, bellek yönetimini otomatik olarak gerçekleştiren bir mekanizmadır. Bellekte kullanılmayan nesneleri ve bellek sızıntılarını otomatik olarak temizler.';
    } else if (message.toLowerCase() ==
        'Javada IOException ve FileNotFoundException arasındaki fark nedir?') {
      return 'IOException, genel giriş/çıkış işlemleri sırasında oluşabilecek hataları temsil eden bir sınıftır. FileNotFoundException, dosya işlemlerinde ortaya çıkan spesifik bir IOException türevidir ve dosyanın bulunamaması durumunda oluşur.';
    } else {
      return 'Üzgünüm, bu soruya henüz cevap veremiyorum.';
    }
  }
}

// ChatMessage sınıfı
class ChatMessage {
  final String text;
  final bool isUserMessage;

  ChatMessage({
    required this.text,
    required this.isUserMessage,
  });
}

// main fonksiyonu
void main() {
  AIAssistant assistant = AIAssistant();

  // İstediğiniz kadar mesaj iletişimi yapabilirsiniz
  String userMessage = 'Merhaba';
  String assistantResponse = assistant.getResponse(userMessage);

  print('Kullanıcı: $userMessage');
  print('Asistan: $assistantResponse');
}