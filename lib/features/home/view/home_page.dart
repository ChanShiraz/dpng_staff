import 'package:dpng_staff/features/home/models/course_model.dart';
import 'package:dpng_staff/features/home/view/message_model.dart';
import 'package:dpng_staff/features/home/widgets/assessment_card.dart';
import 'package:dpng_staff/features/home/widgets/calender_widget.dart';
import 'package:dpng_staff/features/home/widgets/course_card.dart';
import 'package:dpng_staff/features/home/widgets/message_widget.dart';
import 'package:dpng_staff/features/home/widgets/sidebar.dart';
import 'package:dpng_staff/features/home/widgets/track_toggle.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  List<CourseModel> get sampleCourses => [
    CourseModel(
      title: 'English 9A',
      schedule: 'Track A',
      color: Colors.purple.shade300,
    ),
    CourseModel(
      title: 'World History',
      schedule: 'Tue, Thu 11:00 AM - 12:30 PM',
      color: Colors.deepOrange.shade300,
    ),
    CourseModel(
      title: 'Biology 101',
      schedule: 'Mon, Wed 1:00 PM - 2:30 PM',
      color: Colors.green.shade400,
    ),
    CourseModel(
      title: 'Biology 101',
      schedule: 'Mon, Wed 1:00 PM - 2:30 PM',
      color: Colors.green.shade400,
    ),
  ];

  List<MessageModel> get sampleMessages => [
    MessageModel(
      name: 'Emily Moore',
      excerpt: 'Question about homework',
      unread: 1,
    ),
    MessageModel(
      name: 'Michael Lee',
      excerpt: 'Could you help me with',
      unread: 3,
    ),
    MessageModel(name: 'Ashley Smith', excerpt: 'When is the assignment...'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F7FB),
      body: LayoutBuilder(
        builder: (context, constraints) {
          final isWide = constraints.maxWidth > 1100;
          return Row(
            children: [
              // Sidebar
              const Sidebar(expanded: true),
              // Main area
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 18,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      // Top controls: track toggle + menu icon
                      Row(
                        children: [
                          const SizedBox(width: 6),
                          const TrackToggle(),
                          const Spacer(),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.menu),
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 18),

                      // Courses carousel
                      CourseCarousel(courses: sampleCourses),

                      const SizedBox(height: 18),

                      // Content grid
                      Expanded(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Left column (big) - assessments stacked
                            Expanded(
                              flex: 2,
                              child: Column(
                                children: [
                                  const AssessmentCard(
                                    title: 'Summative Assessment Overview',
                                    toGrade: 3,
                                    submissions: 7,
                                    total: 10,
                                  ),
                                  const SizedBox(height: 18),
                                  const AssessmentCard(
                                    title: 'Formative Assessment Overview',
                                    toGrade: 3,
                                    submissions: 7,
                                    total: 10,
                                  ),
                                  const SizedBox(height: 18),
                                ],
                              ),
                            ),

                            const SizedBox(width: 18),
                            SizedBox(
                              width: isWide ? 360 : 320,
                              child: Column(
                                children: [
                                  SizedBox(height: 8, child: Container()),
                                  const SizedBox(height: 8),
                                  const SizedBox(
                                    height: 320,
                                    child: CalendarWidget(),
                                  ),
                                  const SizedBox(height: 18),
                                  MessagesWidget(messages: sampleMessages),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
