import 'package:flutter/foundation.dart'; // For kIsWeb
import 'package:flutter/material.dart';
import 'package:rohit_arer_portfolio/constants/app_colors.dart';
import 'package:rohit_arer_portfolio/widgets/project_card.dart';

class ProjectsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final isMobileView = MediaQuery.of(context).size.width <= 600;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 0.0),
      child: Column(
        crossAxisAlignment:
            isMobileView ? CrossAxisAlignment.start : CrossAxisAlignment.center,
        children: [
          // Heading
          if (isMobileView || !kIsWeb)
            Padding(
              padding: const EdgeInsets.only(
                left: 16.0,
                right: 16.0,
                top: 0.0, // Add extra top padding for smaller screens
                bottom: 0.0, // Adjust as necessary
              ),
              child: Text(
                'PROJECTS',
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
          if (!isMobileView && kIsWeb)
            // Web Side Heading (overlaid at the top-left of the card)
            Stack(
              children: [
                Center(
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 0, vertical: 16),
                    child: Container(
                      width: 1000, // Fixed width for web
                      child: ProjectCard(
                        title: 'AI Image Recognition App',
                        imageUrl:
                            'assets/images/project.jpg', // Replace with actual image
                        description:
                            'A mobile application that uses machine learning to recognize and classify images in real-time.',
                        domains: [
                          'Machine Learning',
                          'Flutter',
                          'Computer Vision'
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: MediaQuery.of(context).size.width * 0.17,
                  top: -6,
                  child: const Text(
                    'PROJECTS',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          // Project Card
          if (isMobileView || !kIsWeb)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: ProjectCard(
                title: 'AI Image Recognition App',
                imageUrl:
                    'assets/images/project.jpg', // Replace with actual image
                description:
                    'A mobile application that uses machine learning to recognize and classify images in real-time.',
                domains: ['Machine Learning', 'Flutter', 'Computer Vision'],
              ),
            ),
        ],
      ),
    );
  }
}
