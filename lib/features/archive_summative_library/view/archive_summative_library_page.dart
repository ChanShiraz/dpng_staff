import 'package:dpng_staff/common/top_bar.dart';
import 'package:dpng_staff/features/archive_summative_library/controller/archive_summative_library_cotroller.dart';
import 'package:dpng_staff/features/district_summative_library/controller/dis_summative_lib_controller.dart';
import 'package:dpng_staff/features/district_summative_library/models/summative_model.dart';
import 'package:dpng_staff/features/district_summative_library/view/district_summative_library_page.dart';
import 'package:dpng_staff/features/district_summative_library/widgets/button_shadow.dart';
import 'package:dpng_staff/features/district_summative_library/widgets/filter_dropdown.dart';
import 'package:dpng_staff/features/district_summative_library/widgets/preview_panel.dart';
import 'package:dpng_staff/features/district_summative_library/widgets/search_bar.dart';
import 'package:dpng_staff/features/district_summative_library/widgets/summative_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/instance_manager.dart';

class ArchiveSummativeLibraryPage extends StatefulWidget {
  const ArchiveSummativeLibraryPage({super.key});

  @override
  State<ArchiveSummativeLibraryPage> createState() =>
      _ArchiveSummativeLibraryPageState();
}

class _ArchiveSummativeLibraryPageState
    extends State<ArchiveSummativeLibraryPage> {
  final controller = Get.put(ArchiveSummativeLibraryCotroller());
  @override
  void initState() {
    controller.fetchSummatives();
    super.initState();
  }

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
                    title: 'Archived Summative Library',
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
                              'Summative Library',
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
                            arcive: true,
                            controller: controller,
                            // items: items,
                            onSelect: (s) {
                              // setState(() => selected = s);
                              controller.selectSummative(s);
                            },
                            selected: controller.selectedSummative.value,
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Obx(
                            () => PreviewPanel(
                              archive: true,
                              controller: controller,
                              summative: controller.selectedSummative.value,
                            ),
                          ),
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
