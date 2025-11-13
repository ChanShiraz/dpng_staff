import 'package:dpng_staff/features/%20district_rubric_library/pages/district_rubric_library_page.dart';
import 'package:dpng_staff/features/assess_formative/view/assess_formative_page.dart';
import 'package:dpng_staff/features/assess_summative/view/assess_summative_page.dart';
import 'package:dpng_staff/features/assessment_center/view/assessment_center_page.dart';
import 'package:dpng_staff/features/auth/view/login_page.dart';
import 'package:dpng_staff/features/course/view/course_overview_page.dart';
import 'package:dpng_staff/features/district_summative_library/view/district_summative_library_page.dart';
import 'package:dpng_staff/features/grades/pages/grades_page.dart';
import 'package:dpng_staff/features/home/view/home_page.dart';
import 'package:dpng_staff/utils/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: AppTheme.lightTheme,
      home: HomePage()
      //GradesInterface(),
    );
  }
}
