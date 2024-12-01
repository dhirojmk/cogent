import 'dart:io';
import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'edit_post_dialog.dart';
import 'post_actions.dart';

class PostCard extends StatelessWidget {
  final Map<String, dynamic> post;
  final Function(int id) onDelete;
  final Function(int id, String newContent) onEdit;

  const PostCard({
    super.key,
    required this.post,
    required this.onDelete,
    required this.onEdit,
  });

  void _handleEdit(BuildContext context) {
    showEditDialog(
      context: context,
      id: post["id"],
      currentContent: post["content"] ?? "",
      onEdit: onEdit,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Card(
        elevation: 6,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const CircleAvatar(
                    backgroundColor: Colors.blueAccent,
                    radius: 20,
                    child: Icon(
                      Iconsax.user_copy,
                      color: Colors.white,
                      size: 24,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      post["content"] ?? "",
                      style: Theme.of(context).textTheme.bodyLarge,
                      textAlign: TextAlign.start, // Optional: Align text to the start
                    ),
                  ),
                  PostActions(
                    onEdit: () => _handleEdit(context),
                    onDelete: () => onDelete(post["id"]),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              if (post["fileType"] == "photo" && post["filePath"] != null)
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.file(
                    File(post["filePath"]),
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                )
              else if (post["fileType"] != "photo" && post["fileName"] != null)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(
                    "Attachment: ${post["fileName"]}",
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium
                        ?.copyWith(color: Colors.grey[700]),
                  ),
                ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton.icon(
                    onPressed: () {
                      // Handle Like action
                    },
                    icon: const Icon(Iconsax.like_1_copy, color: Colors.blueAccent),
                    label: const Text("Like"),
                  ),
                  TextButton.icon(
                    onPressed: () {
                      // Handle Reply action
                    },
                    icon: const Icon(Icons.comment, color: Colors.blue),
                    label: const Text("Reply"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
