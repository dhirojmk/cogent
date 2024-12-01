import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

class AppBarContent extends StatelessWidget implements PreferredSizeWidget {
  const AppBarContent({super.key}); // Added named 'key' parameter

  @override
  Widget build(BuildContext context) {
    return AppBar(
      // Gradient background decoration
      flexibleSpace: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.deepPurple, Colors.blue],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
      ),
      title: const Row(
        children: [
          CircleAvatar(
            radius: 21,
            backgroundImage: AssetImage('assets/logos/app logo.jpg'), // Add your profile picture
          ),
          SizedBox(width: 10),
          Text(
            "Feed",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ],
      ),
      actions: [
        IconButton(
          icon: const Icon(Iconsax.notification, color: Colors.white),
          tooltip: 'Notifications',
          onPressed: () {
            // Add notification functionality
          },
        ),
        IconButton(
          icon: const Icon(Icons.filter_list, color: Colors.white),
          tooltip: 'Filter',
          onPressed: () {
            // Add filter functionality
          },
        ),
      ],
      elevation: 4.0, // Adds subtle shadow
      centerTitle: true, // Centers the title
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
