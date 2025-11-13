import 'package:dpng_staff/features/district_summative_library/widgets/filter_dropdown.dart';
import 'package:dpng_staff/features/district_summative_library/widgets/search_bar.dart';
import 'package:dpng_staff/features/summative_library/controllers/summative_library_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/summative_table.dart';

class SummativeLibraryPage extends StatelessWidget {
  const SummativeLibraryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SummativeLibraryController());

    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      body: SafeArea(
        child: Column(
          children: [
            _buildTopBar(),
            Expanded(child: const SummativeTable()),
          ],
        ),
      ),
    );
  }

  Widget _buildTopBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              IconButton(
                onPressed: () => Get.back(),
                icon: Icon(Icons.arrow_back_ios),
              ),
              SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "My Summative Library",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                  const Text(
                    "Instructor view • Manage and reuse summatives across your courses",
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              const SizedBox(width: 300, child: SearchBarWidget()),
              const SizedBox(width: 12),
              const FilterDropdown(label: "All Courses"),
              const SizedBox(width: 12),
              const FilterDropdown(label: "All Competencies"),
              const Spacer(),
              ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.add, size: 16),
                label: const Text("New Summative"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF0F172A),
                  foregroundColor: Colors.white,
                ),
              ),
              const SizedBox(width: 8),
              OutlinedButton(onPressed: () {}, child: const Text("Archived")),
              const SizedBox(width: 8),
              OutlinedButton(
                onPressed: () {},
                child: const Text("District Library"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
