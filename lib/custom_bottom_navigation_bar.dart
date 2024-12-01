import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onItemTapped;

  const CustomBottomNavigationBar({
    super.key,
    required this.selectedIndex,
    required this.onItemTapped,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.blueGrey[50],
      selectedItemColor: Colors.blueAccent,
      unselectedItemColor: Colors.black,
      selectedLabelStyle: const TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.bold,
      ),
      unselectedLabelStyle: const TextStyle(
        fontSize: 11,
        fontWeight: FontWeight.w400,
      ),
      currentIndex: selectedIndex,
      onTap: onItemTapped,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Iconsax.home_copy),
          label: 'Feed',
        ),
        BottomNavigationBarItem(
          icon: Icon(Iconsax.message_2_copy),
          label: 'Chat',
        ),
        BottomNavigationBarItem(
          icon: Icon(Iconsax.wallet_1_copy),
          label: 'Purchases',
        ),
        BottomNavigationBarItem(
          icon: Icon(Iconsax.profile_circle_copy),
          label: 'Profile',
        ),
      ],
    );
  }
}
