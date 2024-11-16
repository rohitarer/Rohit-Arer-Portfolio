import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:rohit_arer_portfolio/constants/app_colors.dart';

class ExperienceCard extends StatefulWidget {
  final String title;
  final String monthYear;
  final List<String> details;
  final List<String> domains;

  const ExperienceCard({
    required this.title,
    required this.monthYear,
    required this.details,
    required this.domains,
    Key? key,
  }) : super(key: key);

  @override
  _ExperienceCardState createState() => _ExperienceCardState();
}

class _ExperienceCardState extends State<ExperienceCard> {
  bool _isExpanded = false; // Default collapsed state

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.lightBackground,
      elevation: 4.0,
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 6.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title
            Text(
              widget.title,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 4),

            // Month and Year
            Text(
              widget.monthYear,
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[700],
              ),
            ),
            const SizedBox(height: 8),

            // Details (Expandable Text)
            AnimatedSize(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              child: Text(
                widget.details.join("\n"),
                style: TextStyle(fontSize: 14, color: Colors.grey[800]),
                maxLines: _isExpanded ? null : 10, // Collapsed height
                overflow:
                    _isExpanded ? TextOverflow.visible : TextOverflow.ellipsis,
              ),
            ),
            // const SizedBox(height: 15),

            // Tokens at Bottom Left
            // Tokens at Bottom Left
            SizedBox(
              height: kIsWeb ? 60 : 100, // Adjust height based on platform
              child: Stack(
                children: [
                  // Positioned Tokens
                  Positioned(
                    left: 6, // Align to the bottom-left corner
                    bottom: 6,
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width *
                          0.5, // Half the card width
                      child: Wrap(
                        spacing: 8.0,
                        runSpacing: 8.0,
                        children: widget.domains.map((domain) {
                          return Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 4.0, horizontal: 8.0),
                            decoration: BoxDecoration(
                              color: Colors.grey[600],
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(
                              domain,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ),

                  // Show More/Less Button
                  Positioned(
                    right: 6, // Align to the bottom-right corner
                    bottom: 6,
                    child: DottedBorder(
                      color: AppColors.lightText,
                      strokeWidth: 1,
                      dashPattern: [4, 2],
                      borderType: BorderType.RRect,
                      radius: Radius.circular(8),
                      padding: EdgeInsets.zero,
                      child: TextButton(
                        onPressed: () {
                          setState(() {
                            _isExpanded =
                                !_isExpanded; // Toggle the expanded state
                          });
                        },
                        style: TextButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 24.0, vertical: 8.0),
                        ),
                        child: Text(
                          _isExpanded ? 'Show\nLess...' : 'Show\nMore...',
                          style: const TextStyle(
                            color: AppColors.lightText,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ),
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
