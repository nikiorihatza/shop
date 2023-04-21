import 'package:flutter/cupertino.dart';

class ProfilePage extends StatelessWidget {
  String title = "PROFILE";
  ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Text(
            title,
            style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold
            ),
          ),
        )
      ],
    );
  }
}