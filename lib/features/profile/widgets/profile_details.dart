
import 'package:flutter/material.dart';
import 'package:health_tracker/models/user_model.dart';
import 'package:intl/intl.dart';

class ProfileDetails extends StatelessWidget {
  const ProfileDetails({super.key, required this.user});

  final User user;

  @override
  Widget build(BuildContext context) {
    final DateFormat formatter = DateFormat('MMMM d, y');
    final birthday = user.birthday != null ? formatter.format(user.birthday!) : 'Not set';
    final weight = user.weight != null ? '${user.weight} kg' : 'Not set';
    final height = user.height != null ? '${user.height} cm' : 'Not set';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Personal Information',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        _buildDetailRow('Birthday', birthday),
        _buildDetailRow('Weight', weight),
        _buildDetailRow('Height', height),
      ],
    );
  }

  Widget _buildDetailRow(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: const TextStyle(fontSize: 16)),
          Text(value, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
