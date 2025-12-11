import 'package:dpng_staff/features/auth/controller/login_controller.dart';
import 'package:dpng_staff/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'dp_text_field.dart';

class RightPanel extends StatefulWidget {
  const RightPanel({super.key, required this.controller});
  final LoginController controller;

  @override
  State<RightPanel> createState() => _RightPanelState();
}

class _RightPanelState extends State<RightPanel> {
  final _formKey = GlobalKey<FormState>();
  bool staySignedIn = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 60),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 500),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "SECURE SIGN IN",
                  style: TextStyle(
                    color: Colors.blue,
                    letterSpacing: 2,
                    fontWeight: FontWeight.w500,
                    fontSize: 12,
                  ),
                ),

                const SizedBox(height: 10),

                const Text(
                  "Sign in to DPNG",
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),

                const Text(
                  'Use your organization email and password.',
                  style: TextStyle(color: Colors.grey),
                ),

                const SizedBox(height: 30),

                // EMAIL LABEL
                const Text(
                  'Work email',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Colors.black54,
                  ),
                ),
                const SizedBox(height: 6),

                // EMAIL TEXT FIELD
                TextFormField(
                  controller: widget.controller.emailController,
                  decoration: const InputDecoration(
                    hintText: "you@schooldistrict.org",
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Email is required";
                    }
                    final emailRegex = RegExp(
                      r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$',
                    );
                    if (!emailRegex.hasMatch(value)) {
                      return "Enter a valid email address";
                    }
                    return null;
                  },
                ),

                const SizedBox(height: 16),

                // PASSWORD LABEL
                const Text(
                  'Password',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Colors.black54,
                  ),
                ),
                const SizedBox(height: 6),

                // PASSWORD FIELD
                TextFormField(
                  controller: widget.controller.passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    hintText: "Enter your password",
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Password is required";
                    }
                    if (value.length < 6) {
                      return "Password must be at least 6 characters";
                    }
                    return null;
                  },
                ),

                // KEEP ME SIGNED IN + FORGOT PASSWORD
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: Row(
                    children: [
                      Checkbox(
                        value: staySignedIn,
                        onChanged: (v) {
                          setState(() {
                            staySignedIn = v ?? false;
                          });
                        },
                        checkColor: Colors.white,
                        activeColor: Colors.blue,
                      ),
                      const Text(
                        "Keep me signed in",
                        style: TextStyle(color: Colors.grey),
                      ),

                      const Spacer(),

                      TextButton(
                        onPressed: () {
                          // TODO: forgot password logic
                        },
                        child: const Text("Forgot password?"),
                      ),
                    ],
                  ),
                ),

                // SIGN IN BUTTON
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue.shade400,
                    minimumSize: Size(double.infinity, 55),
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      widget.controller.login(
                        //staySignedIn: staySignedIn,
                      );
                    }
                  },
                  child: Obx(
                    () => widget.controller.isLoading.value
                        ? Transform.scale(
                            scale: 0.8,
                            child: CircularProgressIndicator(
                              color: Colors.white,
                            ),
                          )
                        : Text('Sign in'),
                  ),
                ),

                const SizedBox(height: 25),

                Row(
                  children: const [
                    Expanded(child: Divider(color: Colors.grey)),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      child: Text(
                        "or continue with",
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                    Expanded(child: Divider()),
                  ],
                ),

                const SizedBox(height: 25),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(double.infinity, 55),
                    backgroundColor: Colors.white,
                  ),
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.login, color: Colors.black87),
                      SizedBox(width: 15),
                      Text(
                        'SSO – Google for Education',
                        style: TextStyle(color: Colors.black87),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 30),

                Center(
                  child: Column(
                    children: const [
                      Text(
                        "By signing in you agree to DPNG's Privacy & data policy",
                        style: TextStyle(fontSize: 12, color: Colors.black54),
                        textAlign: TextAlign.center,
                      ),

                      SizedBox(height: 10),

                      Text(
                        "© 2025 Diploma Plus Next Generation",
                        style: TextStyle(color: Colors.black54, fontSize: 12),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
