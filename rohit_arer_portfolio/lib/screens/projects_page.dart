import 'package:flutter/foundation.dart'; // For kIsWeb
import 'package:flutter/material.dart';
import 'package:rohit_arer_portfolio/constants/app_colors.dart';
import 'package:rohit_arer_portfolio/widgets/project_card.dart';

class ProjectsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 0.0),
      child: Column(
        crossAxisAlignment:
            kIsWeb ? CrossAxisAlignment.center : CrossAxisAlignment.start,
        children: [
          if (!kIsWeb)
            // App Side Heading
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Text(
                'PROJECTS',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
          if (kIsWeb)
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
          if (!kIsWeb)
            // Project Card for App
            ProjectCard(
              title: 'AI Image Recognition App',
              imageUrl:
                  'assets/images/project.jpg', // Replace with actual image
              description:
                  'A mobile application that uses machine learning to recognize and classify images in real-time.',
              domains: ['Machine Learning', 'Flutter', 'Computer Vision'],
            ),
        ],
      ),
    );
  }
}
