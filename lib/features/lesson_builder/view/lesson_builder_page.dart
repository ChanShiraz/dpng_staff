import 'package:dpng_staff/common/top_bar.dart';
import 'package:dpng_staff/features/lesson_builder/widgets/lesson_information_card.dart';
import 'package:flutter/material.dart';

class LessonBuilderPage extends StatelessWidget {
  const LessonBuilderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff8fafc),
      body: SafeArea(
        child: Column(
          children: [
            TopBar(
              title: 'Design a Lesson',
              subtitle: 'Lesson Builder',
              trailing: Row(
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xfff8fafc),
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.visibility, color: Colors.black),
                        SizedBox(width: 5),
                        Text(
                          'Student View',
                          style: TextStyle(color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                    ),
                    child: Text('Save lesson'),
                  ),
                ],
              ),
            ),
            // LessonInformationCard(
            // lessonTitleController: lessonTitleController,
            // lessonDescriptionController: lessonDescriptionController,
            // objectivesController: objectivesController,
            // summativeOptions: const [
            //   'Economic Terms/Concepts 25-26',
            //   'Market Economies Summative',
            // ],
            // selectedSummative: selectedSummative,
            // onSummativeChanged: (value) {
            //   selectedSummative = value!;
            // },
            // onEditPressed: () {
            //   // open bottom sheet / dialog
            // },
            //  ),
          ],
        ),
      ),
    );
  }
}
