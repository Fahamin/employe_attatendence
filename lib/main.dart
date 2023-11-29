import 'package:employe_attatendence/route/routes.dart';
import 'package:employe_attatendence/screen/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'constants/constance.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Supabase.initialize(url: SUPABASE_URL, anonKey: SUPABASE_KEY);
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Attendance System',
        initialRoute: Routes.homePage,
        getPages: appRoutes());

  }
}
