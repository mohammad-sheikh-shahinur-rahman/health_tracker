
import 'package:flutter/material.dart';
import 'package:health_tracker/features/ai_chat/ai_chat_screen.dart';
import 'package:health_tracker/features/ai_diet/ai_diet_screen.dart';
import 'package:health_tracker/features/dashboard/dashboard_screen.dart';
import 'package:health_tracker/features/devices/devices_screen.dart';
import 'package:health_tracker/features/profile/me_screen.dart';
import 'package:health_tracker/features/workouts/workouts_screen.dart';
import 'package:health_tracker/models/blood_glucose.dart';
import 'package:health_tracker/models/blood_pressure.dart';
import 'package:health_tracker/models/medicine.dart';
import 'package:health_tracker/models/user_adapter.dart';
import 'package:health_tracker/models/user_model.dart';
import 'package:health_tracker/services/notification_service.dart';
import 'package:health_tracker/services/permission_service.dart';
import 'package:health_tracker/services/tts_service.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await PermissionService().requestAllPermissions();
  await NotificationService().init();
  await TtsService().init();
  await Hive.initFlutter();

  Hive.registerAdapter(MedicineAdapter());
  Hive.registerAdapter(BloodPressureAdapter());
  Hive.registerAdapter(BloodGlucoseAdapter());
  Hive.registerAdapter(UserAdapter());

  await Hive.openBox<Medicine>('medicines');
  await Hive.openBox<BloodPressure>('blood_pressure');
  await Hive.openBox<BloodGlucose>('blood_glucose');
  await Hive.openBox<User>('userBox');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Health Tracker',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFFFFA726)), // Orange color scheme
        useMaterial3: true,
      ),
      home: const MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    DashboardScreen(),
    AiDietScreen(),
    WorkoutsScreen(),
    DevicesScreen(),
    MeScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.health_and_safety),
            label: 'Health',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.food_bank_outlined),
            label: 'Diet',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.fitness_center),
            label: 'Workouts',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.devices),
            label: 'Devices',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Me',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Theme.of(context).colorScheme.primary,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const AiChatScreen()),
        ),
        child: const Icon(Icons.chat_bubble_outline),
      ),
    );
  }
}
