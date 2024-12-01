import 'package:flutter/material.dart';
import '../../local_database.dart';
import '../posts/recent_posts_section.dart';
import 'floating_action_button.dart';
import 'post_page.dart';
import 'app_bar_content.dart';
import 'featured_content.dart';
import 'navigation_buttons.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final List<Map<String, dynamic>> _posts = []; // Local post cache
  final DatabaseHelper _dbHelper = DatabaseHelper.instance;

  @override
  void initState() {
    super.initState();
    _loadPosts(); // Load posts from the database when the dashboard initializes
  }

  Future<void> _loadPosts() async {
    final posts = await _dbHelper.fetchPosts();
    setState(() {
      _posts.clear();
      _posts.addAll(posts); // Load posts into the local list
    });
  }

  Future<void> _navigateToPostPage() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const PostPage(),
      ),
    );

    if (result != null && result is Map<String, dynamic>) {
      await _dbHelper.insertPost(result); // Save the post in the database
      await _loadPosts(); // Refresh the posts
    }
  }

  Future<void> _deletePost(int id) async {
    await _dbHelper.deletePost(id); // Remove from the database
    await _loadPosts(); // Refresh the posts
  }

  Future<void> _editPost(int id, String newContent) async {
    await _dbHelper.updatePost(id, {'content': newContent}); // Update in database
    await _loadPosts(); // Refresh the posts
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarContent(), // Custom AppBar
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const FeaturedContent(),
            const NavigationButtons(),
            RecentPostsSection(
              posts: _posts,
              onDelete: _deletePost,
              onEdit: _editPost,
            ), // Updated Recent Posts Section
          ],
        ),
      ),
      floatingActionButton: CustomFloatingActionButton(
        onPostTap: _navigateToPostPage,
      ),
    );
  }
}
