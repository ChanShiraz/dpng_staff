import 'package:dpng_staff/features/auth/models/user_model.dart';
import 'package:dpng_staff/features/auth/view/login_page.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class UserController extends GetxController {
  final SupabaseClient supabase = Supabase.instance.client;
  final box = GetStorage();
  Rx<UserModel?> currentUser = Rx<UserModel?>(null);
  RxInt learningYear = 0.obs;
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    loadUser();
  }

  void loadUser() {
    try {
      final data = box.read('user');
      currentUser.value = data != null ? UserModel.fromJson(data) : null;
      if (currentUser.value != null) {
        loadCurrentLY(currentUser.value!.schoolId!);
      }
    } catch (e) {
      print('Error $e');
    }
  }

  Future<void> loadCurrentLY(int schoolId) async {
    isLoading.value = true;
    try {
      final query = supabase
          .from('alt_learning_year')
          .select('alyid')
          .eq('schoolid', schoolId)
          .eq('current', 1)
          .single();
      final result = await query;
      learningYear.value = result['alyid'];
    } catch (e) {
      print('error $e');
    }
    isLoading.value = false;
  }

  void saveUser(UserModel user) {
    currentUser.value = user;
    box.write('user', user.toJson());
  }

  void logout() {
    currentUser.value = null;
    box.remove('user');
    Get.deleteAll();

    Get.offAll(LoginPage());
  }
}
