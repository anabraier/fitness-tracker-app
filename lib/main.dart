import 'package:firebase_core/firebase_core.dart';
import 'package:fitness_tracker_app/features/app/splash_screen/splash_screen.dart';
import 'package:fitness_tracker_app/features/user_auth/presentation/pages/home_page.dart';
import 'package:fitness_tracker_app/features/user_auth/presentation/pages/login_page.dart';
import 'package:fitness_tracker_app/features/user_auth/presentation/pages/sign_up_page.dart';
import 'package:fitness_tracker_app/screens/Add_Alarm.dart';
import 'package:fitness_tracker_app/screens/Alarm_page.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'firebase_options.dart';
import 'package:fitness_tracker_app/screens/homescreen.dart';
import 'package:fitness_tracker_app/screens/workouts.dart';
import 'package:fitness_tracker_app/screens/Add_Alarm.dart';



Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
      apiKey: "AIzaSyAjZpGdiBeTBKjkL2zdl9mb_RyfEfw7xNs",
      appId: "1:35179312839:web:6873ebac537be434d970e2",
      messagingSenderId: "35179312839",
      projectId: "my-fitness-tracker-ddd68",
    ));
  } else {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Firebase',
      routes: {
        '/': (context) => const SplashScreen(
              // Here, you can decide whether to show the LoginPage or HomePage based on user authentication
              child: LoginPage(),
            ),
        '/login': (context) => const LoginPage(),
        '/signUp': (context) => const SignUpPage(),
        '/home': (context) => HomeScreen(),
        '/workouts': (context) => TextFormFieldsDisplay(),
        '/alarms': (context) => AlarmSettingScreen()
      },
    );
  }
}

