import 'package:employe_attatendence/screen/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'constants/constance.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  /*await dotenv.load();
  var supabaseUrl = dotenv.env['SUPABASE_URL']!;
  var supabaseKey = dotenv.env['SUPABASE_key']!;*/
  
  await Supabase.initialize(url: SUPABASE_URL, anonKey: SUPABASE_KEY);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Attendance System',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: LoginScreen()
    );
  }
}
