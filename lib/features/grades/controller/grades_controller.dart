import 'package:dpng_staff/features/grades/models/competency.dart';
import 'package:dpng_staff/features/grades/models/course.dart';
import 'package:dpng_staff/features/grades/models/standard.dart';
import 'package:dpng_staff/features/grades/models/student.dart';
import 'package:dpng_staff/features/grades/models/summative.dart';
import 'package:dpng_staff/features/grades/pages/grades_page.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class GradesController extends GetxController {
  // view state: 'gradebook', 'course', 'work', 'summative', 'final'
  var view = 'gradebook'.obs;
  var compact = false.obs;

  // selected items
  var selectedCourse = Rxn<Course>();
  var selectedStudent = Rxn<Student>();
  var selectedRecord = Rxn<Summative>();

  // final grade submit simulation
  var finalSaved = false.obs;
  var savedFinalGrade = ''.obs;

  void openGradebook() {
    view.value = 'gradebook';
    selectedCourse.value = null;
    selectedStudent.value = null;
    selectedRecord.value = null;
  }

  void openCourse(Course course) {
    selectedCourse.value = course;
    view.value = 'course';
    selectedStudent.value = null;
    selectedRecord.value = null;
  }

  void openStudentWork(Student student) {
    selectedStudent.value = student;
    view.value = 'work';
  }

  void openSummative(Summative record) {
    selectedRecord.value = record;
    view.value = 'summative';
  }

  void openFinal(Student student) {
    selectedStudent.value = student;
    selectedRecord.value = SUMMATIVES.first;
    view.value = 'final';
  }

  void toggleCompact() => compact.value = !compact.value;

  void submitFinalGrade(String grade) {
    savedFinalGrade.value = grade;
    finalSaved.value = true;
    // simulate a short delay then keep saved flag true
  }

  String gradeLabel(String grade) => grade;

  String gradeColorKey(String grade) {
    switch (grade) {
      case 'NO EVIDENCE':
        return 'red';
      case 'BRIDGING':
        return 'purple';
      case 'PROFICIENT':
        return 'blue';
      case 'METACOGNITION':
        return 'green';
      case 'PASS':
        return 'slate';
      default:
        return 'gray';
    }
  }

  String statusColorKey(String status) {
    if (status == 'Completed') return 'green';
    if (status == 'In Progress') return 'blue';
    return 'gray';
  }

  final COURSES = [
    Course(id: 'ushA', name: 'US History A', track: 'Track A'),
    Course(id: 'ushB', name: 'US History B', track: 'Track B'),
    Course(id: 'econ', name: 'Economics', track: 'Track A'),
    Course(
      id: 'seminarA',
      name: 'Success Seminar A [Escalante]',
      track: 'Track B',
    ),
  ];

  final STUDENTS = [
    Student(
      id: 's1',
      name: 'Adrian Villegas-Lopez',
      email: 'avillegas25@matrix4success.org',
      status: 'In Progress',
      grade: 'METACOGNITION',
    ),
    Student(
      id: 's2',
      name: 'Alessandro Arzaluz',
      email: 'aarzaluz27@matrix4success.org',
      status: 'In Progress',
      grade: 'NO EVIDENCE',
    ),
    Student(
      id: 's3',
      name: 'Alex Hernandez Gonzalez',
      email: 'ahernandez26@matrix4success.org',
      status: 'In Progress',
      grade: 'METACOGNITION',
    ),
    Student(
      id: 's4',
      name: 'Allison Gutierrez-Mendez',
      email: 'agutierrez28@matrix4success.org',
      status: 'Completed',
      grade: 'METACOGNITION',
    ),
    Student(
      id: 's5',
      name: 'Benjamin B Ayala Sepulveda',
      email: 'bayala25@matrix4success.org',
      status: 'In Progress',
      grade: 'PROFICIENT',
    ),
  ];

  final SUMMATIVES = [
    Summative(
      id: 'sum1',
      title: 'Progressive and Industrial Era 25–26',
      studentTitle: 'Child Labor Slideshow',
      description:
          'Students will create Google Slides on the conditions and consequences of child labor in America.',
      dateSubmitted: '2025-05-19',
      dateAssessed: '2025-05-22',
      status: 'ASSESSED-ACCEPTED',
      grade: 'METACOGNITION',
      competency: Competency(
        code: 'ss02',
        title: 'Change, Cause and Effect',
        desc: 'Understand change, cause and effect.',
        level: 'METACOGNITION',
      ),
      standard: Standard(
        code: 'CA USH 11.2',
        desc:
            'Students analyze the relationship among the rise of industrialization, large-scale rural-to-urban migration, and massive immigration from Southern and Eastern Europe.',
        level: 'METACOGNITION',
      ),
    ),
  ];
}
