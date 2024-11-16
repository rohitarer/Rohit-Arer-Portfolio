import 'dart:math';

import 'package:flutter/foundation.dart'; // To use kIsWeb
import 'package:flutter/material.dart';
import 'package:rohit_arer_portfolio/constants/app_colors.dart';
import 'package:url_launcher/url_launcher.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback onAboutTap;
  final VoidCallback onExperienceTap;
  final VoidCallback onProjectsTap;

  const CustomAppBar({
    required this.onAboutTap,
    required this.onExperienceTap,
    required this.onProjectsTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
          pinned: true, // Keeps the AppBar pinned while scrolling
          title: Row(
            mainAxisAlignment: kIsWeb
                ? MainAxisAlignment.spaceBetween // For web: space out items
                : MainAxisAlignment.start, // For mobile: align left
            children: [
              // Left-side Logo or Name
              Text(
                'Rohit Arer',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: kIsWeb ? 24 : 20, // Larger font size for web
                  color: Colors.black,
                ),
              ),
              const Spacer(),
              if (kIsWeb)
                // Centered navigation for web
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _NavLink('About Me', onAboutTap),
                    const SizedBox(width: 20),
                    _NavLink('Experience', onExperienceTap),
                    const SizedBox(width: 20),
                    _NavLink('Projects', onProjectsTap),
                  ],
                ),
              if (kIsWeb) const Spacer(),
              // Right-side Buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                    onPressed: _launchResume,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 10),
                    ),
                    child: Row(
                      children: const [
                        Text('Resume', style: TextStyle(color: Colors.white)),
                        SizedBox(width: 8),
                        Icon(Icons.open_in_new, color: Colors.white, size: 18),
                      ],
                    ),
                  ),
                  const SizedBox(width: 0), // Space between buttons
                  IconButton(
                    icon: Image.asset(
                      'assets/icons/linkedin.png',
                      width: 36,
                      height: 36,
                    ),
                    onPressed: _launchLinkedIn,
                  ),
                ],
              ),
            ],
          ),
          toolbarHeight:
              kIsWeb ? 80 : kToolbarHeight, // Increase height for web
        ),
      ],
    );
  }

  // Updated _NavLink widget with styles
  Widget _NavLink(String title, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: MouseRegion(
        cursor: SystemMouseCursors.click, // Change cursor to a pointer on hover
        child: Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold, // Bold font
            color: Color.fromARGB(255, 0, 0, 0), // Blue accent color
          ),
        ),
      ),
    );
  }

  // Open LinkedIn Profile
  void _launchLinkedIn() async {
    const url = 'https://www.linkedin.com/in/rohit-arer-a96294214/';
    if (!await launchUrl(Uri.parse(url))) {
      print('Could not launch $url');
    }
  }

  // Open Resume
  void _launchResume() async {
    const url =
        'https://drive.google.com/file/d/1WC5fQv62YFfdG4-dOartB8EnFQVoinzW/view?usp=sharing';
    if (!await launchUrl(Uri.parse(url))) {
      print('Could not launch $url');
    }
  }

  @override
  Size get preferredSize => Size.fromHeight(kIsWeb ? 80 : kToolbarHeight);
}
