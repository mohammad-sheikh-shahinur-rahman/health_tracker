
import 'package:flutter/material.dart';
import 'package:health_tracker/features/profile/profile_viewmodel.dart';
import 'package:health_tracker/features/profile/widgets/profile_details.dart';
import 'package:health_tracker/features/profile/widgets/profile_header.dart';
import 'package:provider/provider.dart';

class MeScreen extends StatelessWidget {
  const MeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ProfileViewModel(),
      child: Consumer<ProfileViewModel>(
        builder: (context, viewModel, child) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('User Profile'),
            ),
            body: viewModel.user == null
                ? const Center(child: CircularProgressIndicator())
                : ListView(
                    padding: const EdgeInsets.all(16.0),
                    children: [
                      ProfileHeader(user: viewModel.user!),
                      const SizedBox(height: 32),
                      ProfileDetails(user: viewModel.user!),
                    ],
                  ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                // TODO: Implement edit profile functionality
              },
              child: const Icon(Icons.edit),
            ),
          );
        },
      ),
    );
  }
}
