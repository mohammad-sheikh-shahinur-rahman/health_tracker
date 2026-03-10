import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';

class DevicesScreen extends StatefulWidget {
  const DevicesScreen({super.key});

  @override
  State<DevicesScreen> createState() => _DevicesScreenState();
}

class _DevicesScreenState extends State<DevicesScreen> {
  // TODO: Implement Bluetooth device scanning and connection logic

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Devices', style: TextStyle(fontWeight: FontWeight.bold)),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              // TODO: Start scanning for devices
            },
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          _buildConnectedDeviceCard(),
          const SizedBox(height: 24),
          _buildDialCenter(),
          const SizedBox(height: 24),
          _buildDeviceManagementList(),
        ],
      ),
    );
  }

  Widget _buildConnectedDeviceCard() {
    // Placeholder for a connected device
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            // Placeholder for device image
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Icon(Icons.watch, size: 40, color: Colors.grey),
            ),
            const SizedBox(width: 16),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Smart Watch', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                SizedBox(height: 4),
                Row(
                  children: [
                    Icon(Icons.battery_full, color: Colors.green, size: 16),
                    SizedBox(width: 4),
                    Text('50%'),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDialCenter() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Dial Center', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            TextButton(onPressed: () {}, child: const Text('More')),
          ],
        ),
        SizedBox(
          height: 100,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: 5,
            separatorBuilder: (context, index) => const SizedBox(width: 12),
            itemBuilder: (context, index) {
              // Placeholder for watch faces
              return Container(
                width: 80,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Center(child: Icon(Icons.watch_outlined, color: Colors.grey)),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildDeviceManagementList() {
    return Column(
      children: [
        _buildManagementTile(icon: Icons.credit_card, title: 'My Cards'),
        _buildManagementTile(icon: Icons.bluetooth_audio, title: 'Bluetooth Calling'),
        _buildManagementTile(icon: Icons.notifications, title: 'Push Notification'),
        _buildManagementTile(icon: Icons.call, title: 'Call Notifications'),
        _buildManagementTile(icon: Icons.do_not_disturb, title: 'Do not Disturb'),
      ],
    );
  }

  Widget _buildManagementTile({required IconData icon, required String title}) {
    return Card(
      elevation: 1,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        leading: Icon(icon, color: Theme.of(context).colorScheme.primary),
        title: Text(title),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: () {},
      ),
    );
  }
}
