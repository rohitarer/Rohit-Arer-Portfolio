import 'package:flutter/material.dart';
import 'package:rohit_arer_portfolio/constants/app_colors.dart';
import 'package:rohit_arer_portfolio/screens/about_me_page.dart';
import 'package:rohit_arer_portfolio/screens/experience_page.dart';
import 'package:rohit_arer_portfolio/screens/projects_page.dart';
import 'package:rohit_arer_portfolio/widgets/app_bar.dart';
import 'package:rohit_arer_portfolio/widgets/footer.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeScreen extends StatelessWidget {
  // Define keys for each section
  final GlobalKey aboutKey = GlobalKey();
  final GlobalKey experienceKey = GlobalKey();
  final GlobalKey projectsKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        onAboutTap: () => _scrollToSection(aboutKey),
        onExperienceTap: () => _scrollToSection(experienceKey),
        onProjectsTap: () => _scrollToSection(projectsKey),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Introduction Section
              Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: 16.0, vertical: 12.0),
                color: AppColors.lightBackground,
                child: Column(
                  children: [
                    const SizedBox(height: 150),
                    const Text(
                      "Hi, I'm Rohit",
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.w600,
                        color: AppColors.lightText,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 40),
                    const Text(
                      'AI & NLP',
                      style: TextStyle(
                        fontSize: 60,
                        color: AppColors.solidText,
                        fontWeight: FontWeight.bold,
                        height: 0.7,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const Text(
                      'Developer.',
                      style: TextStyle(
                        fontSize: 60,
                        color: AppColors.solidText,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 44),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: Image.asset(
                                'assets/icons/linkedin.png',
                                width: 40,
                                height: 40,
                              ),
                              onPressed: _launchLinkedIn,
                            ),
                            IconButton(
                              icon: Image.asset(
                                'assets/icons/github.png',
                                width: 40,
                                height: 40,
                              ),
                              onPressed: _launchGitHub,
                            ),
                          ],
                        ),
                        const SizedBox(width: 20),
                        ElevatedButton(
                          onPressed: _workWithMe,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 8,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Text(
                                'Work with Me',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16),
                              ),
                              const SizedBox(width: 8),
                              const Icon(
                                Icons.arrow_forward_ios_rounded,
                                color: Colors.white,
                                size: 20,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),
                    Text(
                      'Machine Learning | Natural Language Processing | Flutter Development | Java + DSA | Python',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[600],
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 24),
                    Text(
                      '"Code is like humor. When you have to explain it, it’s bad."',
                      style: TextStyle(
                        fontSize: 18,
                        fontStyle: FontStyle.normal,
                        color: Colors.grey[800],
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 150),
                  ],
                ),
              ),
              // About Me Section
              Container(key: aboutKey, child: AboutMePage()),
              const SizedBox(height: 44),

              // Experience Section
              Container(key: experienceKey, child: ExperiencePage()),
              const SizedBox(height: 24),

              // Projects Section
              Container(key: projectsKey, child: ProjectsPage()),
              const SizedBox(height: 24),

              // Footer
              Footer(),
            ],
          ),
        ),
      ),
    );
  }

  void _scrollToSection(GlobalKey key) {
    final context = key.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void _launchLinkedIn() async {
    const url = 'https://www.linkedin.com/in/rohit-arer-a96294214/';
    if (!await launchUrl(Uri.parse(url))) {
      print('Could not launch $url');
    }
  }

  void _launchGitHub() async {
    const url = 'https://github.com/rohitarer';
    if (!await launchUrl(Uri.parse(url))) {
      print('Could not launch $url');
    }
  }

  void _workWithMe() async {
    const emailUrl =
        'mailto:rohitarer00@gmail.com?subject=Work%20Opportunity%20with%20Rohit%20Arer';
    if (!await launchUrl(Uri.parse(emailUrl))) {
      print('Could not launch $emailUrl');
    }
  }
}
