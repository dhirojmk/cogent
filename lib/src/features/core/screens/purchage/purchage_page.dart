import 'package:flutter/material.dart';

class PurchasesPage extends StatelessWidget {
  const PurchasesPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Get the screen size
    final screenWidth = MediaQuery.of(context).size.width;
    final isSmallScreen = screenWidth < 600; // Consider devices with width < 600 as small screens (like phones)

    return Scaffold(
      appBar: AppBar(title: const Text('Course Subscriptions')),
      body: Padding(
        padding: EdgeInsets.all(isSmallScreen ? 8.0 : 16.0), // Less padding on small screens
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Available Courses',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: 5, // Dummy number of courses
                itemBuilder: (context, index) {
                  return Card(
                    margin: EdgeInsets.symmetric(vertical: isSmallScreen ? 4.0 : 8.0), // Smaller margins on small screens
                    child: ListTile(
                      contentPadding: EdgeInsets.all(isSmallScreen ? 12.0 : 16.0), // Smaller padding on small screens
                      leading: const Icon(Icons.school, size: 40), // Course icon
                      title: Text('Course ${index + 1}', style: TextStyle(fontSize: isSmallScreen ? 18.0 : 20.0)),
                      subtitle: Text('Description of course ${index + 1}', style: TextStyle(fontSize: isSmallScreen ? 12.0 : 14.0)),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min, // Ensure the Row doesn't take all space
                        children: [
                          Text(
                            '\$${(index + 1) * 50}', // Pricing for subscription
                            style: TextStyle(
                              fontSize: isSmallScreen ? 14.0 : 16.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(width: 8), // Add some spacing between text and button
                          SizedBox(
                            width: isSmallScreen ? 100 : 140, // Adjust the button width based on screen size
                            child: ElevatedButton(
                              onPressed: () {
                                // Handle course subscription logic
                              },
                              child: const Text('Subscribe Now'),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
