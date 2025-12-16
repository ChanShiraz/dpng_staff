import 'package:dpng_staff/features/rubric_creation/controller/rubric_controller.dart';
import 'package:dpng_staff/features/rubric_creation/models/competency.dart';
import 'package:dpng_staff/features/rubric_creation/steps/step5_rubric_levels.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class AlignedCompetenciesCard extends StatelessWidget {
  AlignedCompetenciesCard({super.key});
  final controller = Get.find<RubricController>();

  @override
  Widget build(BuildContext context) {
    return RoundContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Aligned Competencies',
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: controller.selectedCompetencies.length,
            itemBuilder: (context, index) => _CompetencyTile(
              competency: controller.selectedCompetencies[index],
            ),
          ),

          Text(
            'Click any competency to view details and the alignment breakdown.',
            style: TextStyle(fontSize: 12, color: Colors.grey),
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}

class _CompetencyTile extends StatelessWidget {
  _CompetencyTile({super.key, required this.competency});
  final Competency competency;
  final controller = Get.find<RubricController>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: RoundContainer(
        padding: 0,
        child: Obx(
          () => ListTile(
            onTap: () => controller.selectAlignedCompetency(competency),
            // leading: Icon(Icons.check_circle, color: Colors.green.shade300),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadiusGeometry.circular(10),
            ),
            selected:
                controller.selectedAlignedCompetency.value!.dpcid ==
                competency.dpcid,
            selectedTileColor: Colors.green.shade50,

            title: Text(
              '${competency.dpc_label}: ${competency.dpc_heading} - ${competency.scope}',
              style: TextStyle(color: Colors.black, fontSize: 14),
            ),
          ),
        ),
      ),
    );
  }
}

// class CompetencyAlignmentCard extends StatelessWidget {
//   const CompetencyAlignmentCard({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final textTheme = Theme.of(context).textTheme;

//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         /// Description
//         Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 10),
//           child: RichText(
//             text: TextSpan(
//               style: textTheme.bodyMedium?.copyWith(color: Colors.black87),
//               children: const [
//                 TextSpan(
//                   text: 'Description: ',
//                   style: TextStyle(fontWeight: FontWeight.w600),
//                 ),
//                 TextSpan(
//                   text: 'Make sense of problems and persevere in solving them.',
//                 ),
//               ],
//             ),
//           ),
//         ),

//         /// Main Card
//         Padding(
//           padding: const EdgeInsets.all(10),
//           child: Container(
//             width: double.infinity,
//             padding: const EdgeInsets.all(20),
//             decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.circular(12),
//               border: Border.all(color: Colors.grey.shade300),
//             ),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 /// Title
//                 Text(
//                   'COMPETENCY–LEVEL ALIGNMENT BREAKDOWN',
//                   style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
//                 ),

//                 const SizedBox(height: 16),
//                 _sectionText(
//                   title: 'Level 1–3:',
//                   body:
//                       'Build awareness of how authors express bias and how to distinguish opinion, fact, and perspective. These levels focus on developing foundational understanding and may include teacher support to identify an author\'s voice and bias, connecting to the influence on the writer\'s side.',
//                 ),

//                 const SizedBox(height: 12),

//                 _sectionText(
//                   title: 'Level 4:',
//                   body:
//                       'Extend analysis to how those biases shape meaning and credibility—applying the competency through interpretation of external contexts such as social, cultural, political, and historical factors.',
//                 ),

//                 const SizedBox(height: 12),

//                 _sectionText(
//                   title: 'Level 5 (Metacognition):',
//                   body:
//                       'Move inward by recognizing that readers, too, are influenced by individual, social, cultural, political, and historical contexts—just like the author. Reflection on personal bias completes the circle of understanding between reader and writer influence, fully realizing the competency.',
//                 ),

//                 const SizedBox(height: 20),

//                 /// Why This Matters
//                 Text(
//                   'WHY THIS COMPETENCY MATTERS:',
//                   style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
//                 ),

//                 const SizedBox(height: 12),

//                 Text(
//                   'Recognizing bias and author voice reflects a critical mindset toward reading. It develops proficiency in ELA by helping students examine how perspective and context shape meaning, credibility, and intent, while also becoming aware of their own interpretive stance.',
//                   style: textTheme.bodyMedium?.copyWith(
//                     height: 1.5,
//                     color: Colors.black87,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ],
//     );
//   }

//   /// Reusable section builder
//   Widget _sectionText({required String title, required String body}) {
//     return RichText(
//       text: TextSpan(
//         style: const TextStyle(
//           fontSize: 14,
//           height: 1.5,
//           color: Colors.black87,
//         ),
//         children: [
//           TextSpan(
//             text: '$title ',
//             style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
//           ),
//           TextSpan(text: body),
//         ],
//       ),
//     );
//   }
// }
