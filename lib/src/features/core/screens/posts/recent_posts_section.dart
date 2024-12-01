import 'package:flutter/material.dart';
import 'post_card.dart';

class RecentPostsSection extends StatelessWidget {
  final List<Map<String, dynamic>> posts;
  final Function(int id) onDelete;
  final Function(int id, String newContent) onEdit;

  const RecentPostsSection({
    super.key,
    required this.posts,
    required this.onDelete,
    required this.onEdit,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            "Recent Posts",
            style: Theme.of(context)
                .textTheme
                .titleLarge
                ?.copyWith(fontWeight: FontWeight.bold),
          ),
        ),
        ...posts.map((post) => PostCard(
          post: post,
          onDelete: onDelete,
          onEdit: onEdit,
        )),
      ],
    );
  }
}
