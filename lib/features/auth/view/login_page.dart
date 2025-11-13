import 'package:dpng_staff/features/auth/controller/login_controller.dart';
import 'package:dpng_staff/features/home/view/home_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final controller = Get.put(LoginController());
  final _formKey = GlobalKey<FormState>(); // ✅ Add form key

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          final isWide = constraints.maxWidth > 800;

          return Row(
            children: [
              if (isWide)
                Expanded(
                  flex: 1,
                  child: Container(
                    color: Colors.blue.shade50,
                    child: Center(
                      child: Image.asset(
                        'assets/images/icon.png',
                        width: 300,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
              Expanded(
                flex: 1,
                child: Center(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.all(32),
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 400),
                      child: Card(
                        elevation: 4,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(24),
                          child: Form(
                            key: _formKey, // ✅ wrap with Form
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Text(
                                  'Login',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineMedium
                                      ?.copyWith(fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.center,
                                ),
                                const SizedBox(height: 32),

                                // EMAIL FIELD
                                TextFormField(
                                  controller: controller.emailController,
                                  decoration: const InputDecoration(
                                    labelText: 'Email',
                                    prefixIcon: Icon(Icons.email),
                                    border: OutlineInputBorder(),
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter your email';
                                    } else if (!GetUtils.isEmail(value)) {
                                      return 'Please enter a valid email';
                                    }
                                    return null;
                                  },
                                ),

                                const SizedBox(height: 16),

                                // PASSWORD FIELD
                                Obx(
                                  () => TextFormField(
                                    controller: controller.passwordController,
                                    obscureText:
                                        !controller.isPasswordVisible.value,
                                    decoration: InputDecoration(
                                      labelText: 'Password',
                                      prefixIcon: const Icon(Icons.lock),
                                      border: const OutlineInputBorder(),
                                      suffixIcon: IconButton(
                                        icon: Icon(
                                          controller.isPasswordVisible.value
                                              ? Icons.visibility
                                              : Icons.visibility_off,
                                        ),
                                        onPressed:
                                            controller.togglePasswordVisibility,
                                      ),
                                    ),
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please enter your password';
                                      } else if (value.length < 6) {
                                        return 'Password must be at least 6 characters';
                                      }
                                      return null;
                                    },
                                  ),
                                ),

                                const SizedBox(height: 12),

                                Align(
                                  alignment: Alignment.centerRight,
                                  child: TextButton(
                                    onPressed: controller.forgotPassword,
                                    child: const Text('Forgot Password?'),
                                  ),
                                ),

                                const SizedBox(height: 20),

                                // LOGIN BUTTON
                                Obx(
                                  () => ElevatedButton(
                                    onPressed: () => Get.to(HomePage()),
                                    // controller.isLoading.value
                                    //     ? null
                                    //     : () {
                                    //         if (_formKey.currentState!
                                    //             .validate()) {
                                    //           controller.login();
                                    //         }
                                    //       },
                                    // style: ElevatedButton.styleFrom(
                                    //   padding: const EdgeInsets.symmetric(
                                    //     vertical: 16,
                                    //   ),
                                    //   shape: RoundedRectangleBorder(
                                    //     borderRadius: BorderRadius.circular(12),
                                    //   ),
                                    // ),
                                    child: controller.isLoading.value
                                        ? const CircularProgressIndicator()
                                        : const Text(
                                            'Login',
                                            style: TextStyle(fontSize: 16),
                                          ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
