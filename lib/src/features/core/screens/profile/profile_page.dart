import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isSmallScreen = screenWidth < 600; // Consider devices with width < 600 as small screens

    return Scaffold(
      appBar: AppBar(title: const Text('Profile')),
      body: Padding(
        padding: EdgeInsets.all(isSmallScreen ? 8.0 : 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // User Avatar
            CircleAvatar(
              radius: isSmallScreen ? 50 : 80,
              backgroundImage: const NetworkImage('https://via.placeholder.com/150'),
            ),
            const SizedBox(height: 16),

            // User Name
            Text(
              'John Doe', // Placeholder name
              style: TextStyle(
                fontSize: isSmallScreen ? 20 : 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),

            // User Bio
            Text(
              'A passionate developer and tech enthusiast. Always learning and sharing knowledge.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: isSmallScreen ? 14 : 16,
                color: Colors.grey[700],
              ),
            ),
            const SizedBox(height: 20),

            // Social Media and Settings
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: const Icon(Icons.facebook),
                  onPressed: () {
                    // Handle Facebook link
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.linked_camera_outlined),
                  onPressed: () {
                    // Handle Twitter link
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.link),
                  onPressed: () {
                    // Handle LinkedIn link
                  },
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Settings Button
            SizedBox(
              width: isSmallScreen ? 150 : 200,
              child: ElevatedButton(
                onPressed: () {
                  // Navigate to settings page
                },
                child: const Text('Edit Profile'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
