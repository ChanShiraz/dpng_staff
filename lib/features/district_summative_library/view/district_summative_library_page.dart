import 'package:dpng_staff/common/top_bar.dart';
import 'package:dpng_staff/features/district_summative_library/models/summative_model.dart';
import 'package:dpng_staff/features/district_summative_library/widgets/button_shadow.dart';
import 'package:dpng_staff/features/district_summative_library/widgets/filter_dropdown.dart';
import 'package:dpng_staff/features/district_summative_library/widgets/preview_panel.dart';
import 'package:dpng_staff/features/district_summative_library/widgets/search_bar.dart';
import 'package:dpng_staff/features/district_summative_library/widgets/summative_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/instance_manager.dart';

class DistrictSummativeLibraryPage extends StatefulWidget {
  const DistrictSummativeLibraryPage({super.key});

  @override
  State<DistrictSummativeLibraryPage> createState() =>
      _DistrictSummativeLibraryPageState();
}

class _DistrictSummativeLibraryPageState
    extends State<DistrictSummativeLibraryPage> {
  SummativeModel? selected;

  final List<SummativeModel> items = [
    SummativeModel(
      title: "Ecosystems – Project Brief",
      subject: "Science",
      standards: ["MS-LS2-3", "MS-LS2-4"],
      competencies: ["Systems Thinking", "Scientific Inquiry"],
      description:
          "Design a mini-ecosystem and maintain a reflection journal on feedback loops.",
      tags: ["Project", "Reflection"],
      grade: "Grade 6",
      author: "D. Patel",
      example: "Reflection stems + self-assessment checklist.",
    ),
    SummativeModel(
      title: "Informational Text Analysis – Common Prompt",
      subject: "ELA",
      standards: ["CCSS.ELA-LITERACY.RI.7.1", "CCSS.ELA-LITERACY.W.7.2"],
      competencies: ["Close Reading", "Evidence Use"],
      description: "Analyze informational text with common rubric and prompt.",
      tags: ["Text Evidence", "CLB"],
      grade: "Grade 8",
      author: "Jefferson MS",
      example: "Shared rubric across sections.",
    ),
    SummativeModel(
      title: "Linear Functions – Performance Task",
      subject: "Math",
      standards: [
        "CCSS.MATH.CONTENT.HSF.IF.B.4",
        "CCSS.MATH.CONTENT.HSF.LE.A.1",
      ],
      competencies: ["Modeling", "Reasoning", "Communication"],
      description:
          "Use linear functions to model and solve real-world performance problems.",
      tags: ["Performance", "Rubric-Aligned"],
      grade: "Grade 9",
      author: "All Schools",
      example: "Student modeling and graph interpretation task.",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      body: SafeArea(
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: Column(
                children: [
                  TopBar(
                    title: 'Summative Library',
                    type: 2,
                    subtitle: 'Browse, filter, and preview summatives…',
                    trailing: Row(
                      children: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
                            minimumSize: Size(10, 45),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadiusGeometry.circular(15),
                            ),
                          ),
                          onPressed: () {},
                          child: Text('Add Summative'),
                        ),
                        SizedBox(width: 10),
                        ButtonShadow(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              elevation: 0,
                              backgroundColor: Colors.white,
                              minimumSize: Size(10, 45),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadiusGeometry.circular(15),
                              ),
                            ),
                            onPressed: () {},
                            child: Text(
                              'Arcive',
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        ButtonShadow(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              elevation: 0,
                              backgroundColor: Colors.white,
                              minimumSize: Size(10, 45),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadiusGeometry.circular(15),
                              ),
                            ),
                            onPressed: () {},
                            child: Text(
                              'Distric Summative',
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        ButtonShadow(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              elevation: 0,
                              backgroundColor: Colors.white,
                              minimumSize: Size(10, 45),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadiusGeometry.circular(15),
                              ),
                            ),
                            onPressed: () {},
                            child: Text(
                              'Reset',
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 10,
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 3,
                          child: Material(
                            borderRadius: BorderRadius.circular(15),
                            //elevation: 1,
                            child: TextField(
                              decoration: InputDecoration(
                                prefixIcon: Icon(Icons.search, size: 20),
                                hintText:
                                    'Search by title, subject, or standard...',
                                filled: true,
                                fillColor: Colors.white,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        FilterWidget(
                          title: 'All Subjects',
                          leading: Icons.filter_alt_outlined,
                          trailing: Icons.keyboard_arrow_down_sharp,
                        ),
                        SizedBox(width: 10),
                        FilterWidget(
                          title: 'Title A-Z',
                          leading: Icons.sort,
                          trailing: Icons.keyboard_arrow_down_sharp,
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: SummativeList(
                            items: items,
                            onSelect: (s) => setState(() => selected = s),
                            selected: selected,
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: PreviewPanel(summative: selected),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FilterWidget extends StatelessWidget {
  const FilterWidget({
    super.key,
    required this.title,
    required this.leading,
    required this.trailing,
  });
  final String title;
  final IconData leading;
  final IconData trailing;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        height: 48,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade300),
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(leading, size: 20),
                SizedBox(width: 10),
                Text(title),
              ],
            ),
            Icon(trailing, size: 20),
          ],
        ),
      ),
    );
  }
}
