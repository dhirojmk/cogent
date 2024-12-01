import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

class CustomFloatingActionButton extends StatelessWidget {
  final VoidCallback onPostTap;

  const CustomFloatingActionButton({super.key, required this.onPostTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50.0,  // Adjust size as needed
      height: 50.0, // Adjust size as needed
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(
          colors: [Colors.deepPurple, Colors.blueAccent], // Gradient colors
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: FloatingActionButton(
        onPressed: onPostTap,
        backgroundColor: Colors.transparent,  // Set backgroundColor to transparent
        elevation: 0,  // Remove the shadow if needed
        child: const Icon(
          Iconsax.add_copy,
          color: Colors.white,
          size: 35,
        ),
      ),
    );
  }
}
