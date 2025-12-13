import 'package:dpng_staff/features/student_summative_work/models/summative_submission.dart';
import 'package:dpng_staff/features/student_summative_work/widgets/info_row.dart';
import 'package:dpng_staff/features/student_summative_work/widgets/label_chip.dart';
import 'package:dpng_staff/utils/grade_helper.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AssessmentInfoSection extends StatelessWidget {
  AssessmentInfoSection({super.key, required this.submission});
  final SummativeSubmission submission;

  final DateFormat dateFormat = DateFormat('dd/MM/yyy');

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Summative Assessment Info",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 14),
          LayoutBuilder(
            builder: (context, constraints) {
              final isWide = constraints.maxWidth > 500;
              return isWide
                  ? Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(child: _leftColumn()),
                        const SizedBox(width: 24),
                        Expanded(child: _rightColumn(submission.grade)),
                      ],
                    )
                  : Column(
                      children: [
                        _leftColumn(),
                        const SizedBox(height: 20),
                        _rightColumn(submission.grade),
                      ],
                    );
            },
          ),
          const SizedBox(height: 16),
          const Divider(height: 32, color: Color(0xffe5e7eb)),
          // CTA + Status row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _viewButton(),
              Text(
                "Status: ${StatusHelper.statusText(submission.status)}",
                style: TextStyle(
                  fontSize: 12,
                  color: StatusHelper.statusColor(submission.status),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _leftColumn() {
    return Column(
      children: [
        InfoRow(label: "Submitted", value: dateFormat.format(submission.date)),
        InfoRow(
          label: "Assessed",
          value: dateFormat.format(submission.assessed),
        ),
      ],
    );
  }

  Widget _rightColumn(int grade) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InfoGroup(
          title: "Grade",
          subtitle: null,
          badge: GradeHelper.getGradeLabel(grade),
          badgeColor: GradeHelper.getGradeColor(grade),
          textColor: Colors.white,
        ),
        SizedBox(height: 12),
        InfoGroup(
          title: "DP Competency Assessed",
          subtitle: "S07 – Scientific Systems",
          badge: "Proficient",
          badgeColor: Color(0xffEEF2FF),
          textColor: Colors.indigo,
        ),
        SizedBox(height: 12),
        InfoGroup(
          title: "State Standard Assessed",
          subtitle: "HS-LS-1",
          badge: "Proficient",
          badgeColor: Color(0xffEEF2FF),
          textColor: Colors.indigo,
        ),
      ],
    );
  }

  Widget _viewButton() {
    return ElevatedButton(
      onPressed: () {
        print('path link ${submission.pathLink}');
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.black87,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(30),
        ),
      ),
      child: Row(
        children: const [
          Icon(Icons.remove_red_eye, size: 16, color: Colors.white),
          SizedBox(width: 6),
          Text(
            "View My Summative",
            style: TextStyle(
              color: Colors.white,
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

// A small reusable group used in right column (keeps layout tidy)
class InfoGroup extends StatelessWidget {
  final String title;
  final String? subtitle;
  final String badge;
  final Color badgeColor;
  final Color textColor;

  const InfoGroup({
    super.key,
    required this.title,
    this.subtitle,
    required this.badge,
    required this.badgeColor,
    required this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: Colors.grey.shade700,
          ),
        ),
        if (subtitle != null) const SizedBox(height: 4),
        if (subtitle != null)
          Text(
            subtitle!,
            style: const TextStyle(fontSize: 14, color: Colors.black87),
          ),
        const SizedBox(height: 6),
        LabelChip(
          text: badge.toUpperCase(),
          backgroundColor: badgeColor,
          textColor: textColor,
        ),
      ],
    );
  }
}
