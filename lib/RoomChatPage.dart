import 'package:flutter/material.dart';

class RoomChatPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pakar Tanaman Pangan'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                ChatBubble(
                  messageContent: 'Halo, saya mau konsultasi?',
                  messageType: MessageType.sender,
                  userProfileName: 'Coba',
                ),
                ChatBubble(
                  messageContent: 'Boleh, silahkan ceritakan keluhan tanaman Anda',
                  messageType: MessageType.receiver,
                  userProfileName: 'Pakar Tanaman Pangan'
                ),
                ChatBubble(
                  messageContent: 'Ada yang bisa saya bantu?',
                  messageType: MessageType.receiver,
                  userProfileName: 'Pakar Tanaman Pangan'
                ),
                // Tambahkan bubble chat lainnya di sini
              ],
            ),
          ),
          ChatInputField(),
        ],
      ),
    );
  }
}

class ChatBubble extends StatelessWidget {
  final String messageContent;
  final MessageType messageType;
  final String? userProfileImage;
  final String? userProfileName;

  const ChatBubble({
    Key? key,
    required this.messageContent,
    required this.messageType,
    this.userProfileImage,
    this.userProfileName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: messageType == MessageType.sender
            ? MainAxisAlignment.end
            : MainAxisAlignment.start,
        children: [
          if (messageType == MessageType.receiver && userProfileImage != null)
            CircleAvatar(
              radius: 20,
              backgroundImage: AssetImage(userProfileImage!),
            ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                color: messageType == MessageType.sender
                    ? Color(0xFFaadfc0) // Warna bubble untuk pengirim
                    : Color.fromARGB(255, 211, 218, 214), // Warna bubble untuk penerima
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (userProfileName != null)
                    Text(
                      userProfileName!,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 55, 122, 58),
                      ),
                    ),
                  Text(
                    messageContent,
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

enum MessageType {
  sender,
  receiver,
}

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
                hintText: 'Tulis keluhanmu...',
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
