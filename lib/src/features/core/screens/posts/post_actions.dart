import 'package:flutter/material.dart';

class PostActions extends StatelessWidget {
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  const PostActions({
    super.key,
    required this.onEdit,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      onSelected: (value) {
        if (value == "Edit") {
          onEdit();
        } else if (value == "Delete") {
          onDelete();
        }
      },
      itemBuilder: (context) => [
        const PopupMenuItem(
          value: "Edit",
          child: Text("Edit"),
        ),
        const PopupMenuItem(
          value: "Delete",
          child: Text("Delete"),
        ),
      ],
      icon: const Icon(Icons.more_vert, color: Colors.grey),
    );
  }
}
