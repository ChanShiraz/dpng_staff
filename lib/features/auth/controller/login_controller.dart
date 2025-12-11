import 'package:dpng_staff/features/auth/models/user_model.dart';
import 'package:dpng_staff/features/home/view/home_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class LoginController extends GetxController {
  final isLoading = false.obs;
  final isPasswordVisible = false.obs;

  SupabaseClient supabase = Supabase.instance.client;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final box = GetStorage();

  Future<void> login() async {
    isLoading.value = true;
    try {
      final response = await supabase
          .from('users')
          .select()
          .eq('email', emailController.text.trim())
          .maybeSingle();

      if (response == null) {
        Get.rawSnackbar(message: 'User not found');
        return;
      }

      final dbPassword = response['password'];
      final role = response['role'];
      final isActive = response['active'] == 1;

      if (dbPassword != passwordController.text) {
        Get.rawSnackbar(message: 'Invalid email or password');
        return;
      }
      if (role != 2) {
        Get.rawSnackbar(message: 'Unauthorized access!');
        return;
      }

      if (!isActive) {
        Get.rawSnackbar(message: 'Your account is inactive');
        return;
      }

      final userId = response['userid'];
      await box.write('auth', true);
      await box.write('userid', userId);
      await getUser();
      Get.offAll(HomePage());
    } catch (e) {
      Get.rawSnackbar(message: 'Error! Something went wrong!');
      print('error login $e');
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> getUser() async {
    isLoading.value = true;

    try {
      final userId = await box.read('userid');
      print('userid ${await box.read('userid')}');
      if (userId != null) {
        final response = await supabase
            .from('users')
            .select('*, roles:roles!users_role_fkey(description)')
            .eq('userid', userId)
            .eq('active', 1)
            .maybeSingle();
        print('response $response');
        if (response != null) {
          UserModel user = UserModel.fromJson(response);
          await box.write('user', user.toJson());
        }
      }
    } catch (e) {
      Get.rawSnackbar(message: 'Error! Some error occured!');
      print('error gettting user $e');
    }
    isLoading.value = false;
  }

  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
