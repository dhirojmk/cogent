import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

class PostPage extends StatefulWidget {
  const PostPage({super.key});

  @override
  State<PostPage> createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  final TextEditingController _contentController = TextEditingController();
  String? _fileAttachmentPath;
  String? _fileAttachmentName;
  String? _fileType; // To store the type of the attached file ("photo" or "pdf").

  Future<void> _uploadFile() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpg', 'jpeg', 'png', 'pdf'],
    );

    if (result != null && result.files.isNotEmpty) {
      final filePath = result.files.first.path;
      final fileName = result.files.first.name;

      setState(() {
        _fileAttachmentPath = filePath;
        _fileAttachmentName = fileName;

        // Determine the file type based on the extension.
        if (fileName.endsWith('.jpg') ||
            fileName.endsWith('.jpeg') ||
            fileName.endsWith('.png')) {
          _fileType = 'photo';
        } else if (fileName.endsWith('.pdf')) {
          _fileType = 'pdf';
        }
            });
    }
  }

  void _submitPost() {
    if (_contentController.text.isNotEmpty) {
      final postContent = _contentController.text;
      Navigator.pop(context, {
        "content": postContent,
        "filePath": _fileAttachmentPath,
        "fileName": _fileAttachmentName,
        "fileType": _fileType, // Pass the file type.
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: AppBar(
          title: const Text(
            "Create a Post",
            style: TextStyle(
              color: Colors.white, // Set text color to white
            ),
          ),
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.deepPurple, Colors.blueAccent], // Gradient colors
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          elevation: 0,
          actions: [
            IconButton(
              icon: const Icon(
                Icons.help_outline,
                color: Colors.white, // Set icon color to white
              ),
              onPressed: () {
                // Help button functionality
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                "Share your thoughts with the community!",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurple,
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: _contentController,
                decoration: InputDecoration(
                  labelText: "Write your post or ask a question...",
                  labelStyle: const TextStyle(color: Colors.deepPurple),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                    borderSide: const BorderSide(color: Colors.deepPurple),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.deepPurple),
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  prefixIcon: const Icon(Iconsax.edit_2_copy, color: Colors.deepPurple),
                  contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
                ),
                maxLines: 4,
              ),
              const SizedBox(height: 20),
              ElevatedButton.icon(
                onPressed: _uploadFile,
                icon: const Icon(Iconsax.attach_square_copy, color: Colors.white),
                label: const Text(
                  "Attach Photo or PDF",
                  style: TextStyle(
                    color: Colors.white,  // Set text color to white
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.lightBlue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  elevation: 5,
                ),
              ),
              if (_fileAttachmentName != null)
                Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: Row(
                    children: [
                      const Icon(Icons.check_circle, color: Colors.green),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          "Attachment: $_fileAttachmentName",
                          style: const TextStyle(color: Colors.green),
                        ),
                      ),
                    ],
                  ),
                ),
              const SizedBox(height: 40),
              ElevatedButton(
                onPressed: _submitPost,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  elevation: 5,
                ),
                child: const Text(
                  "Submit Post",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15, // Set text color to white
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
