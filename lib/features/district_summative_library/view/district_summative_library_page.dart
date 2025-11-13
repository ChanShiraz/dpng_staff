import 'package:dpng_staff/features/district_summative_library/models/summative_model.dart';
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
                  _buildTopBar(),
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

  Widget _buildTopBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Row(
        children: [
          IconButton(
            onPressed: () => Get.back(),
            icon: Icon(Icons.arrow_back_ios_new),
          ),
          SizedBox(width: 10),
          const Text(
            "District Summative Library",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
          ),
          const Spacer(),
          const SizedBox(width: 300, child: SearchBarWidget()),
          const SizedBox(width: 10),
          const FilterDropdown(label: "All Subjects"),
          const SizedBox(width: 10),
          const FilterDropdown(label: "All Schools"),
          const SizedBox(width: 10),
          const FilterDropdown(label: "Title A–Z"),
          const SizedBox(width: 10),
          OutlinedButton(onPressed: () {}, child: const Text("Reset")),
        ],
      ),
    );
  }
}
