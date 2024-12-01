import 'package:cogent/src/features/core/screens/dashboard/pages/question_and_answer_page.dart';
import 'package:flutter/material.dart';
import 'pages/news_page.dart';
import 'pages/offerings_page.dart';

import 'pages/my_events_page.dart';

class NavigationButtons extends StatelessWidget {
  const NavigationButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Colors.transparent, Colors.black12],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildDashboardButton(Icons.campaign, "News", context, const NewsPage()),
          _buildDashboardButton(Icons.paypal, "Offerings", context, const OfferingsPage()),
          _buildDashboardButton(Icons.message, "Q&A", context, const QAPage()),
          _buildDashboardButton(Icons.event, "My Events", context, const MyEventsPage()),
        ],
      ),
    );
  }

  Widget _buildDashboardButton(IconData icon, String label, BuildContext context, Widget page) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => page),
        );
      },
      child: Column(
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                colors: [Colors.blue, Colors.purple],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Center(
              child: Icon(icon, color: Colors.white, size: 35),
            ),
          ),
          const SizedBox(height: 5),
          Text(
            label,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black87,
              fontSize: 13,
            ),
          ),
        ],
      ),
    );
  }
}
