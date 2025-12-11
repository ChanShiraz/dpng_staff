import 'package:dpng_staff/features/war_reporting/step1/widgets/generate_report.dart';
import 'package:dpng_staff/features/war_reporting/step2/view/war_report_page2.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class RowSelectButtons extends StatelessWidget {
  const RowSelectButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _iconBtn(Icons.arrow_forward, () => Get.to(WarReportStep2())),
          const SizedBox(width: 6),
          _iconBtn(Icons.print, () {
            generateWarReportPdf();
          }),
        ],
      ),
    );
  }

  Widget _iconBtn(IconData icon, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: const Color(0xff0e5fe3),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Icon(icon, color: Colors.white, size: 18),
      ),
    );
  }
}
