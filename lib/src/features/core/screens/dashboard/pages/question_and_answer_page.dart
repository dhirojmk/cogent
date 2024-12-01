import 'package:flutter/material.dart';
import '../../../local_database.dart'; // Import the DatabaseHelper

class QAPage extends StatefulWidget {
  const QAPage({super.key});

  @override
  _QAPageState createState() => _QAPageState();
}

class _QAPageState extends State<QAPage> {
  late Future<List<Map<String, dynamic>>> posts;

  @override
  void initState() {
    super.initState();
    posts = fetchPostsFromDatabase();
  }

  // Fetch posts from the database (excluding file name)
  Future<List<Map<String, dynamic>>> fetchPostsFromDatabase() async {
    final dbHelper = DatabaseHelper.instance;
    return await dbHelper.fetchPosts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(55.0), // Height of the AppBar
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.blue, Colors.purple], // Gradient colors
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: AppBar(
            elevation: 0, // No shadow
            backgroundColor: Colors.transparent, // Make AppBar background transparent
            title: const Text(
              "Q&A",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24,color: Colors.white),
            ),
            actions: [
              IconButton(
                icon: const Icon(Icons.add),
                onPressed: () {
                  // Action to add a new post can be added here
                },
              ),
            ],
          ),
        ),
      ),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: posts,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text("No posts available"));
          } else {
            final postList = snapshot.data!;
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.builder(
                itemCount: postList.length,
                itemBuilder: (context, index) {
                  final post = postList[index];
                  return Card(
                    elevation: 4,
                    margin: const EdgeInsets.symmetric(vertical: 8.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: ListTile(
                      contentPadding: const EdgeInsets.all(16.0),
                      title: Text(
                        "ID: ${post['id']}",
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 8),
                          Text(
                            post['content'] ?? '',
                            overflow: TextOverflow.ellipsis, // Add ellipsis if text overflows
                            softWrap: true, // Allow wrapping of text
                            maxLines: 3, // Limit content to 3 lines
                            style: const TextStyle(fontSize: 16),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            "File Type: ${post['fileType'] ?? 'N/A'}",
                            style: const TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            );
          }
        },
      ),
    );
  }
}
