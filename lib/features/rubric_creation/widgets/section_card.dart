import 'package:dpng_staff/features/rubric_creation/controller/rubric_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SectionCard extends StatelessWidget {
  final int index;
  final String title;
  final String subtitle;
  final bool completed;
  final bool locked;
  final Widget child;
  final VoidCallback? onNext;
  final VoidCallback? onBack;

  const SectionCard({
    super.key,
    required this.index,
    required this.title,
    required this.subtitle,
    required this.completed,
    required this.locked,
    required this.child,
    this.onNext,
    this.onBack,
  });

  @override
  Widget build(BuildContext context) {
    final RubricController c = Get.find<RubricController>();
    final isOpen = c.openStep.value == index;
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(color: locked ? Colors.grey[200]! : Colors.grey[300]!),
      ),
      child: ExpansionTile(
        shape: const Border(),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.w500)),
        subtitle: Text(subtitle, style: TextStyle(color: Colors.black45)),
        leading: Icon(
          completed ? Icons.check_circle : Icons.menu_book_outlined,
          color: completed ? Colors.green : Colors.blueGrey,
        ),

        children: [
          Column(
            children: [
              Divider(height: 1, color: Colors.grey[300]),
              Padding(padding: const EdgeInsets.all(16), child: child),
              Divider(height: 1, color: Colors.grey[300]),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      onPressed: onBack,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: onBack == null
                            ? Colors.grey[100]
                            : Colors.white,
                        foregroundColor: Colors.black87,
                      ),
                      child: const Text("Back"),
                    ),
                    ElevatedButton(
                      onPressed: onNext,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: onNext == null
                            ? Colors.grey[100]
                            : Colors.white,
                        foregroundColor: Colors.black87,
                      ),
                      child: const Text("Next"),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
