import 'package:dpng_staff/features/district_summative_library/widgets/filter_dropdown.dart';
import 'package:dpng_staff/features/district_summative_library/widgets/search_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/rubric_controller.dart';
import '../widgets/rubric_list.dart';
import '../widgets/preview_panel_rubric.dart';

class DistrictRubricLibraryPage extends StatelessWidget {
  const DistrictRubricLibraryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(DistrictRubricController());

    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              _buildTopBar(),
              Expanded(
                child: Row(
                  children: [
                    const Expanded(flex: 3, child: RubricList()),
                    SizedBox(width: 10),
                    Expanded(
                      flex: 2,
                      child: Obx(
                        () => PreviewPanelRubric(
                          rubric: controller.selectedRubric.value,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
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
            icon: Icon(Icons.arrow_back_ios),
          ),
          SizedBox(width: 10),
          const Text(
            "District Rubric Library",
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
