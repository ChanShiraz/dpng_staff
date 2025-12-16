import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SummativeAssingnmentController extends GetxController {
  final supabase = Supabase.instance.client;

  RxBool loadingLessons = false.obs;

  void fetchLessons(int summativeId) async {
    loadingLessons.value = true;
    try {
      final query = supabase
          .from('alt_mod_lessons')
          .select('dmod_lesson_id,title,description')
          .eq('dmod_sum_id', summativeId);
      final response = await query;
      for (var element in response) {
        print('lesson ${element['title']}');
      }
    } catch (e) {
      print('error fetching lessons $e');
    }
    loadingLessons.value = false;
  }
}
