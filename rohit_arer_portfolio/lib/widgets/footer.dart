import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Center(
        child: Row(
          mainAxisSize: MainAxisSize.min, // Center the text and image together
          children: [
            Text(
              'Made with ',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 14,
              ),
            ),
            Image.asset(
              'assets/images/heart.png', // Path to your heart PNG
              width: 18, // Adjust the size of the heart image
              height: 18,
              fit: BoxFit.contain,
            ),
            Text(
              ' by Rohit Arer',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
