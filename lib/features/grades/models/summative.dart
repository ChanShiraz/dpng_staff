import 'package:dpng_staff/features/grades/models/competency.dart';
import 'package:dpng_staff/features/grades/models/standard.dart';

class Summative {
  final String id;
  final String title;
  final String studentTitle;
  final String description;
  final String dateSubmitted;
  final String dateAssessed;
  final String status;
  final String grade;
  final Competency competency;
  final Standard standard;

  Summative({required this.id, required this.title, required this.studentTitle, required this.description, required this.dateSubmitted, required this.dateAssessed, required this.status, required this.grade, required this.competency, required this.standard});
}