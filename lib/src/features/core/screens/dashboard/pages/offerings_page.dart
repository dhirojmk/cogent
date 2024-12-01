import 'package:flutter/material.dart';

class OfferingsPage extends StatelessWidget {
  const OfferingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Student Offerings"),
        backgroundColor: Colors.greenAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Category filter (optional)
            Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: Text(
                'Available Offerings',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            // List of offerings
            Expanded(
              child: ListView.builder(
                itemCount: 10,  // Example number of offerings
                itemBuilder: (context, index) {
                  return OfferingCard(
                    title: 'Offering $index',
                    description: 'This is the description for offering $index. Sign up today!',
                    imageUrl: 'https://via.placeholder.com/150',  // Placeholder image
                    date: 'Available Now',
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

class OfferingCard extends StatelessWidget {
  final String title;
  final String description;
  final String imageUrl;
  final String date;

  const OfferingCard({
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              imageUrl,
              width: 80,
              height: 80,
              fit: BoxFit.cover,
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    description,
                    style: const TextStyle(color: Colors.black54),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    date,
                    style: const TextStyle(color: Colors.black45),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
