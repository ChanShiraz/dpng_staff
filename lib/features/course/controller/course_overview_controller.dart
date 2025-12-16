import 'package:dpng_staff/features/course/model/summative.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class CourseOverviewController extends GetxController {
  final supabase = Supabase.instance.client;
  RxList<Summative> summatives = <Summative>[].obs;
  RxBool loadingSummatives = false.obs;

  void fetchSummatives(int aCid) async {
    summatives.clear();
    loadingSummatives.value = true;
    try {
      final query = supabase
          .from('alt_mod_summatives')
          .select('dmod_sum_id,title,task')
          .eq('a_cid', aCid)
          .eq('active', 1);
      final response = await query;
      for (var element in response) {
        summatives.add(Summative.fromMap(element));
      }
    } catch (e) {
      print('error fetching course summatives $e');
    }
    loadingSummatives.value = false;
  }
}
