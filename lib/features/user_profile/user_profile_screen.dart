
import 'package:flutter/material.dart';
import 'package:health_tracker/features/user_profile/widgets/profile_details.dart';
import 'package:health_tracker/features/user_profile/widgets/profile_header.dart';

class UserProfileScreen extends StatelessWidget {
  const UserProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Profile'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: const [
          ProfileHeader(),
          SizedBox(height: 32),
          ProfileDetails(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // TODO: Implement edit profile functionality
        },
        child: const Icon(Icons.edit),
      ),
    );
  }
}
