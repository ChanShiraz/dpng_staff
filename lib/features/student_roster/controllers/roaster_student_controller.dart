// // ignore_for_file: public_member_api_docs, sort_constructors_first
// import 'package:dpng_staff/features/student_roster/models/roster_student.dart';
// import 'package:flutter/widgets.dart';
// import 'package:get/get.dart';
// import 'package:supabase_flutter/supabase_flutter.dart';

// import 'package:dpng_staff/features/auth/controller/user_controller.dart';

// class RoasterStudentController extends GetxController {
//   final supbase = Supabase.instance.client;
//   final currentUser = Get.find<UserController>().currentUser.value;
//   final learningYear = Get.find<UserController>().learningYear.value;
//   final searchTextController = TextEditingController();
//   RxList<RosterStudent> roasterStudents = <RosterStudent>[].obs;
//   RxList<RosterStudent> filteredRoasterStudents = <RosterStudent>[].obs;
//   RxBool isLoading = false.obs;
//   final int aCid;
//   RoasterStudentController({required this.aCid});
//   @override
//   void onInit() {
//     getRoasterStudents(aCid);
//     super.onInit();
//   }

//   void getRoasterStudents(int aCid) async {
//     isLoading.value = true;
//     roasterStudents.clear();
//     filteredRoasterStudents.clear();
//     try {
//       final query = supbase
//           .from('student_course_assignment')
//           .select('users(first,last,email)')
//           .eq('a_cid', aCid)
//           .eq('current', 1)
//       // .eq('active', 1)
//       //.eq('graduated', 0)
//       ;
//       final response = await query;
//       if (response.isNotEmpty) {
//         for (var element in response) {
//           RosterStudent roasterStudent = RosterStudent.fromMap(
//             element['users'],
//           );
//           roasterStudents.add(roasterStudent);
//         }
//       }
//       filteredRoasterStudents.value = roasterStudents;
//     } catch (e) {
//       print('Error getting roaster students $e');
//     }
//     isLoading.value = false;
//   }

//   void searchStudents(String query) {
//     final searchText = query.toLowerCase();

//     filteredRoasterStudents.value = roasterStudents.where((student) {
//       final first = student.first?.toLowerCase() ?? '';
//       final last = student.last?.toLowerCase() ?? '';
//       final email = student.email?.toLowerCase() ?? '';

//       return first.contains(searchText) ||
//           last.contains(searchText) ||
//           email.contains(searchText);
//     }).toList();
//   }
// }
