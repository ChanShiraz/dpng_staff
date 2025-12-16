import 'package:dpng_staff/features/auth/controller/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class LogoutDialog extends StatelessWidget {
  const LogoutDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: const EdgeInsets.all(24),
      child: Container(
        width: 420,
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: const Color(0xffe2e8f0), // same soft border
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Title
            const Text(
              'Log out',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Color(0xff0f172a),
              ),
            ),

            const SizedBox(height: 8),

            /// Description
            const Text(
              'Are you sure you want to log out of your account?',
              style: TextStyle(fontSize: 14, color: Color(0xff64748b)),
            ),

            const SizedBox(height: 24),

            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                /// Cancel
                // _DialogButton(
                //   label: 'Cancel',
                //   isPrimary: false,
                //   onTap: () => Navigator.pop(context),
                // ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFF6F7FB),
                  ),
                  child: Text('Cancel', style: TextStyle(color: Colors.black)),
                ),
                const SizedBox(width: 12),

                /// Logout
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                    Get.find<UserController>().logout();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                  ),
                  child: Text('Log out', style: TextStyle(color: Colors.white)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
