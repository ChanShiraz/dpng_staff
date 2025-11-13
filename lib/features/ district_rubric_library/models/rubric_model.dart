class RubricModel {
  final String title;
  final String subject;
  final List<String> standards;
  final List<String> competencies;
  final String author;
  final String grade;
  final List<String> tags;
  final Map<String, List<String>> rubricTable; // Criterion -> performance levels

  RubricModel({
    required this.title,
    required this.subject,
    required this.standards,
    required this.competencies,
    required this.author,
    required this.grade,
    required this.tags,
    required this.rubricTable,
  });
}
