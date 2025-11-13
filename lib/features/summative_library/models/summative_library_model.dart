class SummativeLibraryModel {
  final String title;
  final String standard;
  final String standardDesc;
  final List<String> competencies;
  final String course;
  final String updated;
  final String teacher;
  final bool selected;

  SummativeLibraryModel({
    required this.title,
    required this.standard,
    required this.standardDesc,
    required this.competencies,
    required this.course,
    required this.updated,
    required this.teacher,
    this.selected = false,
  });

  SummativeLibraryModel copyWith({bool? selected}) => SummativeLibraryModel(
    title: title,
    standard: standard,
    standardDesc: standardDesc,
    competencies: competencies,
    course: course,
    updated: updated,
    teacher: teacher,
    selected: selected ?? this.selected,
  );
}
