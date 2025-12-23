import 'package:dpng_staff/features/rubric_creation/controller/rubric_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SectionCard extends StatefulWidget {
  final int index;
  final String title;
  final String subtitle;
  final bool completed;
  final bool locked;
  final Widget child;
  final VoidCallback? onNext;
  final VoidCallback? onBack;
  final ExpansibleController expansibleController;
  final bool showFooter;

  const SectionCard({
    super.key,
    required this.index,
    required this.title,
    required this.subtitle,
    required this.completed,
    required this.locked,
    required this.child,
    required this.expansibleController,
    this.onNext,
    this.onBack,
    this.showFooter = true,
  });

  @override
  State<SectionCard> createState() => _SectionCardState();
}

class _SectionCardState extends State<SectionCard> {
  @override
  Widget build(BuildContext context) {
    final RubricController c = Get.find<RubricController>();
    final isOpen = c.openStep.value == widget.index;
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(
          color: widget.locked ? Colors.grey[200]! : Colors.grey[300]!,
        ),
      ),
      child: ExpansionTile(
        enabled: widget.locked ? false : true,
        onExpansionChanged: (value) {
          setState(() {});
        },
        controller: widget.expansibleController,
        shape: const Border(),
        title: Text(
          widget.title,
          style: const TextStyle(fontWeight: FontWeight.w500),
        ),
        subtitle: Text(
          widget.subtitle,
          style: TextStyle(color: Colors.black45),
        ),
        leading: Icon(
          widget.completed ? Icons.check_circle : Icons.menu_book_outlined,
          color: widget.completed ? Colors.green : Colors.blueGrey,
        ),

        children: [
          Column(
            children: [
              Divider(height: 1, color: Colors.grey[300]),
              Padding(padding: const EdgeInsets.all(16), child: widget.child),
              if (widget.showFooter)
              Column(
                children: [
                  Divider(height: 1, color: Colors.grey[300]),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(),
                        ElevatedButton(
                          onPressed: widget.onNext,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: widget.onNext == null
                                ? Colors.grey[100]
                                : const Color(0xFF57CC99),
                            foregroundColor: Colors.black87,
                          ),
                          child: Text(
                            "Next",
                            style: widget.onNext == null
                                ? null
                                : TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
