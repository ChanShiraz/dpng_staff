import 'package:dpng_staff/common/top_bar.dart';
import 'package:dpng_staff/features/%20district_rubric_library/widgets/search_tile.dart';
import 'package:dpng_staff/features/assess_formative/widgets/topbar.dart';
import 'package:dpng_staff/features/district_summative_library/widgets/button_shadow.dart';
import 'package:dpng_staff/features/district_summative_library/widgets/filter_dropdown.dart';
import 'package:dpng_staff/features/district_summative_library/widgets/search_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/rubric_controller.dart';
import '../widgets/rubric_list.dart';
import '../widgets/preview_panel_rubric.dart';

class DistrictRubricLibraryPage extends StatefulWidget {
  const DistrictRubricLibraryPage({super.key});

  @override
  State<DistrictRubricLibraryPage> createState() =>
      _DistrictRubricLibraryPageState();
}

class _DistrictRubricLibraryPageState extends State<DistrictRubricLibraryPage> {
  final controller = Get.put(DistrictRubricController());
  @override
  void initState() {
    controller.fetchRubrics();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TopBar(
                title: 'District Rubric Library',
                type: 2,
                subtitle:
                    'Browse, filter, and preview rubrics used across the district.',
                trailing: ButtonShadow(
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                    ),
                    child: Text('Reset', style: TextStyle(color: Colors.black)),
                  ),
                ),
              ),

              // _buildTopBar(),
              SearchTile(),
              Expanded(
                child: Row(
                  children: [
                    Expanded(flex: 5, child: RubricList()),
                    SizedBox(width: 10),
                    Expanded(
                      flex: 3,
                      child: Obx(
                        () => PreviewPanelRubric(
                          controller: controller,
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
}
