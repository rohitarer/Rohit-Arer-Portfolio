import 'package:flutter/foundation.dart'; // For kIsWeb
import 'package:flutter/material.dart';
import 'package:rohit_arer_portfolio/constants/app_colors.dart';
import 'package:rohit_arer_portfolio/widgets/expirence_card.dart';

class ExperiencePage extends StatelessWidget {
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
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
              child: Text(
                'EXPERIENCE',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  height: 0.5,
                ),
                textAlign: TextAlign.left,
              ),
            ),
          if (kIsWeb)
            // Web Side Heading (overlaid at the top-left of the card)
            Stack(
              children: [
                Center(
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 40),
                    child: Container(
                      width: 1000, // Fixed width for web
                      child: ExperienceCard(
                        title: 'Software Engineer',
                        monthYear: 'Jan 2021 - Present',
                        details: [
                          'Developed and maintained multiple applications.',
                          'Collaborated with cross-functional teams.',
                          'Enhanced application performance and reduced load times by optimizing code.',
                          'Developed and maintained multiple applications.',
                          'Collaborated with cross-functional teams.',
                          'Enhanced application performance and reduced load times by optimizing code.',
                          'Developed and maintained multiple applications.',
                          'Collaborated with cross-functional teams.',
                          'Enhanced application performance and reduced load times by optimizing code.',
                          'Developed and maintained multiple applications.',
                          'Collaborated with cross-functional teams.',
                          'Enhanced application performance and reduced load times by optimizing code.',
                          'Developed and maintained multiple applications.',
                          'Collaborated with cross-functional teams.',
                          'Enhanced application performance and reduced load times by optimizing code.',
                          'Developed and maintained multiple applications.',
                          'Collaborated with cross-functional teams.',
                          'Enhanced application performance and reduced load times by optimizing code.',
                        ],
                        domains: [
                          'Flutter',
                          'Dart',
                          'Firebase',
                          'Flutter',
                          'Dart',
                          'Firebase'
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: MediaQuery.of(context).size.width * 0.17,
                  top: 6,
                  child: const Text(
                    'EXPERIENCE',
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
            // Experience Card for App
            Center(
              child: Container(
                width: MediaQuery.of(context).size.width * 0.9,
                child: ExperienceCard(
                  title: 'Software Engineer',
                  monthYear: 'Jan 2021 - Present',
                  details: [
                    'Developed and maintained multiple applications.',
                    'Collaborated with cross-functional teams.',
                    'Enhanced application performance and reduced load times by optimizing code.',
                    'Developed and maintained multiple applications.',
                    'Collaborated with cross-functional teams.',
                    'Enhanced application performance and reduced load times by optimizing code.',
                    'Developed and maintained multiple applications.',
                    'Collaborated with cross-functional teams.',
                    'Enhanced application performance and reduced load times by optimizing code.',
                    'Developed and maintained multiple applications.',
                  ],
                  domains: [
                    'Flutter',
                    'Dart',
                    'Firebase',
                    'Flutter',
                    'Dart',
                    'Firebase'
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}
