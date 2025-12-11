import 'package:pdf/widgets.dart' as pw;
import 'package:pdf/pdf.dart';
import 'package:printing/printing.dart';

Future<void> generateWarReportPdf() async {
  final pdf = pw.Document();

  pdf.addPage(
    pw.Page(
      pageFormat: PdfPageFormat.a4,
      margin: const pw.EdgeInsets.all(24),
      build: (context) {
        return pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            headerSection(),
            pw.SizedBox(height: 10),
            infoSection(),
            pw.SizedBox(height: 10),
            courseObjectivesSection(),
            pw.SizedBox(height: 10),
            methodStudySection(),
            pw.SizedBox(height: 10),
            evaluationSection(),
            pw.SizedBox(height: 10),
            kwSubmissionSection(),
            pw.SizedBox(height: 10),
            learningActivitiesSection(),
            pw.SizedBox(height: 10),
            attachmentSection(),
            pw.SizedBox(height: 10),
            competencySection(),
          ],
        );
      },
    ),
  );

  await Printing.layoutPdf(
    onLayout: (PdfPageFormat format) async => pdf.save(),
  );
}

//header
pw.Widget headerSection() {
  return pw.Column(
    crossAxisAlignment: pw.CrossAxisAlignment.start,
    children: [
      pw.Text(
        "MATRIX 4 SUCCESS ACADEMY",
        style: pw.TextStyle(fontSize: 12, fontWeight: pw.FontWeight.normal),
      ),
      pw.SizedBox(height: 5),
      pw.Text(
        "Assignment and Work Record Form 2025-2026 - Track A - Month 4",
        style: pw.TextStyle(fontSize: 14, fontWeight: pw.FontWeight.normal),
      ),
      pw.Divider(thickness: 1),
    ],
  );
}

//course objective section
pw.Widget courseObjectivesSection() {
  return pw.Column(
    crossAxisAlignment: pw.CrossAxisAlignment.start,
    children: [
      pw.Text("Course Objectives:", style: pw.TextStyle(fontSize: 10)),
      pw.SizedBox(height: 4),
      pw.Text(
        "The student will demonstrate mastery in the following major topics:\n"
        "Topics addressed through assigned formative tasks.",
        style: pw.TextStyle(fontSize: 8),
      ),
    ],
  );
}

//info section
pw.Widget infoSection() {
  return pw.Column(
    crossAxisAlignment: pw.CrossAxisAlignment.start,
    children: [
      pw.Row(
        mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
        children: [
          pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              rowText("NAME:", "Kevin Adorno"),
              pw.SizedBox(height: 5),
              rowText("INSTRUCTOR:", "Rebecca Escalante"),
            ],
          ),
          pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              rowText("START DATE:", "2025-10-04"),
              pw.SizedBox(height: 5),
              rowText("END DATE:", "2025-10-31"),
            ],
          ),

          rowText("COURSE TITLE:", "US History A"),
        ],
      ),
      pw.SizedBox(height: 5),
      pw.Row(children: []),

      pw.SizedBox(height: 12),
      pw.Text(
        "Regular Appointments are required between the teacher and student on the following schedule",
        style: pw.TextStyle(fontSize: 10),
      ),
      pw.SizedBox(height: 5),
      pw.Row(
        mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
        children: [
          rowText("FREQUENCY:", "1x per week"),
          rowText("STARTING (DATE):", "2024-03-06"),
          rowText("TIME:", "Between 8:00am and 3:00pm"),
        ],
      ),
      pw.SizedBox(height: 5),
      rowText("PLACE:", "Matrix School Site"),
      pw.SizedBox(height: 5),
      pw.Row(
        children: [
          rowText("TEACHER SIGNATURE:", "________________"),
          pw.SizedBox(width: 10),
          rowText("EFFECTIVE DATE:", "2024-03-06"),
        ],
      ),
    ],
  );
}

pw.Widget rowText(String label, String value) {
  return pw.Row(
    // mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
    children: [
      pw.Text(
        label,
        style: pw.TextStyle(
          fontWeight: pw.FontWeight.normal,
          fontSize: 8,
          color: PdfColor.fromHex('808080'),
        ),
      ),
      pw.SizedBox(width: 5),
      pw.Text(
        value,
        style: pw.TextStyle(fontWeight: pw.FontWeight.normal, fontSize: 8),
      ),
    ],
  );
}

//method of study section
pw.Widget methodStudySection() {
  return pw.Column(
    crossAxisAlignment: pw.CrossAxisAlignment.start,
    children: [
      pw.Text("Method of Study:", style: pw.TextStyle(fontSize: 10)),
      pw.SizedBox(height: 5),
      pw.Bullet(
        bulletSize: 1.0 * PdfPageFormat.mm,
        text: "In-person check-in and instructional workshop attendance.",
        style: pw.TextStyle(fontSize: 8),
      ),
      pw.Bullet(
        bulletSize: 1.0 * PdfPageFormat.mm,
        text: "Independent study via Diploma Plus Competency-Based platform.",
        style: pw.TextStyle(fontSize: 8),
      ),
    ],
  );
}

//Evaluation Section
pw.Widget evaluationSection() {
  return pw.Column(
    crossAxisAlignment: pw.CrossAxisAlignment.start,
    children: [
      pw.Text("Method of Evaluation:", style: pw.TextStyle(fontSize: 10)),
      pw.SizedBox(height: 5),
      pw.Text("Formative Assessment:", style: pw.TextStyle(fontSize: 8)),
      pw.Bullet(
        bulletSize: 1.0 * PdfPageFormat.mm,
        text: "Submitted all assigned formatives for Month 4.",
        style: pw.TextStyle(fontSize: 8),
      ),
      pw.SizedBox(height: 4),
      pw.Text("Summative Assessment:", style: pw.TextStyle(fontSize: 8)),
      pw.Bullet(
        bulletSize: 1.0 * PdfPageFormat.mm,
        text: "No Summatives submitted this period.",
        style: pw.TextStyle(fontSize: 8),
      ),
    ],
  );
}

//KW Section
pw.Widget kwSubmissionSection() {
  return pw.Column(
    crossAxisAlignment: pw.CrossAxisAlignment.start,
    children: [
      pw.Text("KW Submissions:", style: pw.TextStyle(fontSize: 10)),
      pw.SizedBox(height: 5),
      pw.Bullet(
        bulletSize: 1.0 * PdfPageFormat.mm,
        text: "K - Know Already: Understands key themes...",
        style: pw.TextStyle(fontSize: 8),
      ),
      pw.Bullet(
        bulletSize: 1.0 * PdfPageFormat.mm,
        text: "I - Want to Learn: Seeks deeper understanding...",
        style: pw.TextStyle(fontSize: 8),
      ),
    ],
  );
}

//Learning Activities
pw.Widget learningActivitiesSection() {
  return pw.Column(
    crossAxisAlignment: pw.CrossAxisAlignment.start,
    children: [
      pw.Text(
        "Description of major learning activities:",
        style: pw.TextStyle(fontSize: 10),
      ),
      pw.SizedBox(height: 5),
      pw.Bullet(
        bulletSize: 1.0 * PdfPageFormat.mm,
        text: "Study Materials: Ebook, Diploma Plus learning platform",
        style: pw.TextStyle(fontSize: 8),
      ),
      pw.Bullet(
        bulletSize: 1.0 * PdfPageFormat.mm,
        text: "Supplemental: Tutor.com, Khan Academy, teacher support",
        style: pw.TextStyle(fontSize: 8),
      ),
    ],
  );
}

//Attachments
pw.Widget attachmentSection() {
  return pw.Column(
    crossAxisAlignment: pw.CrossAxisAlignment.start,
    children: [
      pw.Text(
        "Specific Assignments and Evaluation with Samples Attached (links):",
        style: pw.TextStyle(fontSize: 10),
      ),
      pw.SizedBox(height: 5),
      pw.Bullet(
        bulletSize: 1.0 * PdfPageFormat.mm,
        text: "FORMATIVE Set - Month 4",
        style: pw.TextStyle(fontSize: 8),
      ),
      pw.SizedBox(height: 5),
      rowText("SUPERVISING TEACHER:", "Rebecca Escalanate"),
      pw.SizedBox(height: 5),
      pw.Row(
        children: [
          rowText("SUPERVISING TEACHER SIGNATURE:", "  __________________  "),
          pw.SizedBox(height: 5),
          rowText("DATE:", "2025-10-4"),
        ],
      ),
      pw.SizedBox(height: 10),
      pw.Text(
        "Supervising Teacher Comments:",
        style: pw.TextStyle(fontSize: 10),
      ),
      pw.SizedBox(height: 5),
      pw.Text(
        "Bridging: Student meets expections and shows solid understanding.",
        style: pw.TextStyle(fontSize: 8),
      ),
    ],
  );
}

//Competency & % Completed
pw.Widget competencySection() {
  return pw.Row(
    crossAxisAlignment: pw.CrossAxisAlignment.start,
    children: [
      pw.Column(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: [
          pw.Text("Competency Attainment:", style: pw.TextStyle(fontSize: 10)),
          pw.SizedBox(height: 5),
          pw.Container(
            padding: const pw.EdgeInsets.all(8),
            decoration: pw.BoxDecoration(
              color: PdfColors.purple300,
              borderRadius: pw.BorderRadius.circular(6),
            ),
            child: pw.Text(
              "BRIDGING",
              style: pw.TextStyle(color: PdfColors.white, fontSize: 10),
            ),
          ),
        ],
      ),
      pw.SizedBox(width: 10),
      pw.Column(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: [
          pw.Text(
            'Percent of Work Completed:',
            style: pw.TextStyle(fontSize: 10),
          ),
          pw.SizedBox(height: 5),
          pw.Text(
            "100%",
            style: pw.TextStyle(fontSize: 10, color: PdfColors.green),
          ),
        ],
      ),
    ],
  );
}
