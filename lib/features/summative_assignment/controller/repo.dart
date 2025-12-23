import 'package:dpng_staff/features/summative_assignment/models/lesson.dart'
    show Lesson;
import 'package:dpng_staff/features/summative_assignment/models/student.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class CourseSummativeAssignmentRepo {
  final supabase = Supabase.instance.client;

  Future<List<Lesson>> fetchLessons(int dumSumId) async {
    final response = await supabase
        .from('alt_mod_lessons')
        .select('dmod_lesson_id,title,description')
        .eq('dmod_sum_id', dumSumId);
    return response.map((e) => Lesson.fromMap(e)).toList();
  }

  Future<List<Student>> fetchStudents(int acid) async {
    final response = await supabase
        .from('student_course_assignment')
        .select('userid,users(first,last,email,userid)')
        .eq('a_cid', acid)
        .eq('active', 1)
        .eq('graduated', 0);
    return response
        .map((e) => Student.fromMap(e['users']))
        .toList();
  }
}
