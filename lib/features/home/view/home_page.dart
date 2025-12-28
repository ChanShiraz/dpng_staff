import 'package:dpng_staff/features/auth/controller/user_controller.dart';
import 'package:dpng_staff/features/home/controller/courses_controller.dart';
import 'package:dpng_staff/features/home/controller/formative_cotroller.dart';
import 'package:dpng_staff/features/home/controller/summative_controller.dart';
import 'package:dpng_staff/features/home/models/course_model.dart';
import 'package:dpng_staff/features/home/view/message_model.dart';
import 'package:dpng_staff/features/home/widgets/assessment_card.dart';
import 'package:dpng_staff/features/home/widgets/calender_widget.dart';
import 'package:dpng_staff/features/home/widgets/course_card.dart';
import 'package:dpng_staff/features/home/widgets/courses_shimmer.dart';
import 'package:dpng_staff/features/home/widgets/message_widget.dart';
import 'package:dpng_staff/features/home/widgets/sidebar.dart';
import 'package:dpng_staff/features/home/widgets/track_toggle.dart';
import 'package:dpng_staff/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get_rx/src/rx_workers/rx_workers.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final coursesController = Get.put(CoursesController());

  final userController = Get.find<UserController>();

  final summativeController = Get.put(SummativeController());

  final formativeController = Get.put(FormativeCotroller());
  @override
  void initState() {
    ever(userController.isLoading, (loading) {
      if (loading == false && userController.currentUser.value != null) {
        //final ly = userController.learningYear.value;
        coursesController.fetchCourses(coursesController.courseType.value);
        summativeController.calWeekProgress();
        formativeController.calWeekProgress();
        //coursesController.loadSummativeBubbles();
        //summativeController.calWeekProgress();
      }
    });
    super.initState();
  }

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
                  child: Obx(() {
                    return userController.isLoading.value
                        ? SpinKitFadingCircle(color: AppColors.blueLight)
                        : RefreshIndicator(
                            onRefresh: () {
                              summativeController.calWeekProgress();
                              formativeController.calWeekProgress();
                              return coursesController.fetchCourses(
                                coursesController.courseType.value,
                              );
                            },
                            child: SingleChildScrollView(
                              child: ConstrainedBox(
                                constraints: BoxConstraints(
                                  minHeight: MediaQuery.of(context).size.height,
                                ),
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            const SizedBox(width: 6),
                                            TrackToggle(
                                              selectedTrack:
                                                  coursesController
                                                          .courseType
                                                          .value ==
                                                      4
                                                  ? 'A'
                                                  : 'B',
                                              onChanged: (String value) {
                                                if (value.contains('A')) {
                                                  coursesController
                                                          .courseType
                                                          .value =
                                                      4;
                                                } else {
                                                  coursesController
                                                          .courseType
                                                          .value =
                                                      5;
                                                }
                                                coursesController.fetchCourses(
                                                  coursesController
                                                      .courseType
                                                      .value,
                                                );
                                              },
                                              //coursesController: coursesController,
                                            ),
                                          ],
                                        ),
                                        // ElevatedButton.icon(
                                        //   icon: Icon(Icons.refresh),
                                        //   style: ElevatedButton.styleFrom(
                                        //     backgroundColor: Colors.blue.shade600,
                                        //     shape: RoundedRectangleBorder(
                                        //       borderRadius: BorderRadius.circular(
                                        //         30,
                                        //       ),
                                        //     ),
                                        //   ),
                                        //   onPressed: () {},
                                        //   label: Text('Refresh'),
                                        // ),
                                      ],
                                    ),

                                    const SizedBox(height: 18),
                                    Obx(() {
                                      if (coursesController
                                          .fetchingCourses
                                          .value) {
                                        return CourseCarouselShimmer();
                                      }
                                      if (coursesController
                                          .fetchingCoursesError
                                          .value
                                          .isNotEmpty) {
                                        return Center(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              IconButton(
                                                onPressed: () {
                                                  coursesController
                                                      .fetchCourses(
                                                        coursesController
                                                            .courseType
                                                            .value,
                                                      );
                                                },
                                                icon: Icon(
                                                  Icons.refresh,
                                                  size: 32,
                                                  color: AppColors.blueLight,
                                                ),
                                              ),
                                              Text(
                                                coursesController
                                                    .fetchingCoursesError
                                                    .value,
                                                style: const TextStyle(
                                                  color: Colors.red,
                                                  fontSize: 16,
                                                ),
                                              ),
                                            ],
                                          ),
                                        );
                                      }
                                      if (coursesController.courses.isEmpty) {
                                        return const Center(
                                          child: Text(
                                            'No courses assigned yet.',
                                            style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.grey,
                                            ),
                                          ),
                                        );
                                      }
                                      return CourseCarousel(
                                        courses: coursesController.courses,
                                      );
                                    }),
                                    const SizedBox(height: 18),
                                    // Content grid
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        // Left column (big) - assessments stacked
                                        Expanded(
                                          flex: 2,
                                          child: Column(
                                            children: [
                                              Obx(
                                                () =>
                                                    summativeController
                                                        .isLoading
                                                        .value
                                                    ? AssessmentCardShimmer()
                                                    : AssessmentCard(
                                                        title:
                                                            'Weekly Summative Assessment Overview',
                                                        toGrade:
                                                            summativeController
                                                                .y -
                                                            summativeController
                                                                .x,
                                                        submissions:
                                                            summativeController
                                                                .x,
                                                        total:
                                                            summativeController
                                                                .y,
                                                      ),
                                              ),
                                              const SizedBox(height: 18),
                                              Obx(
                                                () =>
                                                    formativeController
                                                        .isLoading
                                                        .value
                                                    ? AssessmentCardShimmer()
                                                    : AssessmentCard(
                                                        formatives: true,
                                                        title:
                                                            'Weekly Formative Assessment Overview',
                                                        toGrade:
                                                            formativeController
                                                                .y -
                                                            formativeController
                                                                .x,
                                                        submissions:
                                                            formativeController
                                                                .x,
                                                        total:
                                                            formativeController
                                                                .y,
                                                      ),
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
                                              SizedBox(
                                                height: 8,
                                                child: Container(),
                                              ),
                                              const SizedBox(height: 8),
                                              const SizedBox(
                                                height: 320,
                                                child: CalendarWidget(),
                                              ),
                                              const SizedBox(height: 18),
                                              // MessagesWidget(messages: sampleMessages),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                  }),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
