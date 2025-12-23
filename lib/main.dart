import 'package:dpng_staff/features/%20district_rubric_library/pages/district_rubric_library_page.dart';
import 'package:dpng_staff/features/assess_formative/view/assess_formative_page.dart';
import 'package:dpng_staff/features/assess_summative/view/assess_summative_page.dart';
import 'package:dpng_staff/features/assessment_center/view/assessment_center_page.dart';
import 'package:dpng_staff/features/auth/controller/user_controller.dart';
import 'package:dpng_staff/features/auth/models/user_model.dart';
import 'package:dpng_staff/features/auth/view/login_page.dart';
import 'package:dpng_staff/features/course/view/course_overview_page.dart';
import 'package:dpng_staff/features/district_summative_library/view/district_summative_library_page.dart';
import 'package:dpng_staff/features/grades/pages/grades_page.dart';
import 'package:dpng_staff/features/home/view/home_page.dart';
import 'package:dpng_staff/utils/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() async {
  await GetStorage.init();
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: 'https://ctetnzfxiuqpxaufhmio.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImN0ZXRuemZ4aXVxcHhhdWZobWlvIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzQzNzQyODcsImV4cCI6MjA0OTk1MDI4N30.i2r1g2raeaC0cmQuZGqjGG5WtrfAJ8_rQVzD5HnWbTg',
  );
  Get.put(UserController(), permanent: true);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final user = Get.find<UserController>().currentUser.value;

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: AppTheme.lightTheme,
      home: user == null ? LoginPage() : HomePage(),
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        FlutterQuillLocalizations.delegate,
      ],
      //GradesInterface(),
    );
  }
}
