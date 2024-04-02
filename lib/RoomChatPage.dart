import 'package:flutter/material.dart';

// Untuk mewakili pesan
class Message {
  final String messageContent;
  final String messageType; // "receiver" or "sender"

  Message({
    required this.messageContent,
    required this.messageType,
  });
}

// Widget untuk halaman obrolan ruang
class RoomChatPage extends StatelessWidget {
  final List<Message> messages = [
    Message(
      messageContent: 'Halo, bagaimana kabarmu?',
      messageType: 'receiver',
    ),
    Message(
      messageContent: 'Halo! Saya baik-baik saja, terima kasih.',
      messageType: 'sender',
    ),
    Message(
      messageContent: 'Apakah kamu sudah mengerjakan tugas itu?',
      messageType: 'receiver',
    ),
    Message(
      messageContent: 'Belum, tapi saya akan segera melakukannya.',
      messageType: 'sender',
    ),
    // Tambahkan pesan lain sesuai kebutuhan
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            color: Color.fromRGBO(170, 223, 192, 1), // Ganti warna sesuai kebutuhan
            padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
            child: Column(
              children: [
                AppBar(
                  title: Text('Pakar Halotani'),
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                ),
                SizedBox(height: 16),
                CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage('assets/img/pakar2.png'), // Ganti dengan foto pakar
                ),
                SizedBox(height: 8),
                Text(
                  'Prof. Dr. Ir. Budioni, M.Sc.', // Ganti dengan nama pakar
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: messages.length,
              shrinkWrap: true,
              padding: EdgeInsets.only(top: 10, bottom: 10),
              physics: BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                final message = messages[index];
                return Container(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Align(
                    alignment: (message.messageType == 'receiver'
                        ? Alignment.topLeft
                        : Alignment.topRight),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: (message.messageType == 'receiver'
                            ? Colors.grey.shade200
                            : Color.fromRGBO(170, 223, 192, 1)),
                      ),
                      padding: EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            message.messageContent,
                            style: TextStyle(fontSize: 15),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          ChatInputField(),
        ],
      ),
    );
  }
}

// untuk input chat
class ChatInputField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.grey[200],
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Tulis pesan...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0),
                ),
              ),
            ),
          ),
          IconButton(
            onPressed: () {
              // Tambahkan aksi untuk mengirim pesan
            },
            icon: Icon(Icons.send),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: RoomChatPage(),
  ));
}
