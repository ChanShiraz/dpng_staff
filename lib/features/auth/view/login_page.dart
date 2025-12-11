import 'package:dpng_staff/features/auth/controller/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../widgets/left_panel.dart';
import '../widgets/right_panel.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});
  final controller = Get.put(LoginController());
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Row(
            children: [
              Expanded(flex: 5, child: const LeftPanel()),
              Expanded(flex: 5, child: RightPanel(controller: controller)),
            ],
          );
        },
      ),
    );
  }
}
