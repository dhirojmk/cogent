import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  // Assuming a boolean flag to check whether the user is subscribed or not
  final bool isSubscribed;

  const ChatPage({super.key, this.isSubscribed = false});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chat'),
        backgroundColor: Colors.blueAccent,
      ),
      body: isSubscribed
          ? Column(
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16.0),
              children: const [
                ChatBubble(
                  text: 'Hello! How can I help you?',
                  isSentByMe: false,
                ),
                ChatBubble(
                  text: 'I would like to know more about your services.',
                  isSentByMe: true,
                ),
                ChatBubble(
                  text: 'Sure! We offer a range of features tailored to your needs.',
                  isSentByMe: false,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Type a message...',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      filled: true,
                      fillColor: Colors.blueGrey[50],
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send, color: Colors.blueAccent),
                  onPressed: () {
                    // Add send message functionality here
                  },
                ),
              ],
            ),
          ),
        ],
      )
          : Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(
                Icons.lock,
                size: 50,
                color: Colors.blueAccent,
              ),
              const SizedBox(height: 20),
              const Text(
                'Subscription Required',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'To access 1-to-1 chat with the admin, please subscribe.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Handle the subscription logic here
                },
                child: const Text('Get Subscription'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ChatBubble extends StatelessWidget {
  final String text;
  final bool isSentByMe;

  const ChatBubble({
    super.key, // Add the named 'key' parameter
    required this.text,
    required this.isSentByMe,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isSentByMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
        margin: const EdgeInsets.symmetric(vertical: 5.0),
        decoration: BoxDecoration(
          color: isSentByMe ? Colors.blueAccent : Colors.grey[200],
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: isSentByMe ? Colors.white : Colors.black,
            fontSize: 15.0,
          ),
        ),
      ),
    );
  }
}
