import 'package:dpng_staff/utils/app_colors.dart';
import 'package:flutter/material.dart';

class LeftPanel extends StatelessWidget {
  const LeftPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 40),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [AppColors.blueLight, Colors.blue],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(22),
          bottomRight: Radius.circular(22),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Image.asset("assets/images/icon.png", height: 90),
              ),
              SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('DPNG PLATFORM', style: TextStyle(color: Colors.white)),
                  Text(
                    'Diploma Plus Next Generation',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 30),

          const Text(
            "Welcome back to your\nDiploma Plus workspace.",
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),

          const SizedBox(height: 20),

          const Text(
            "Engaging learners. Supporting adults. Transforming\neducation.",
            style: TextStyle(fontSize: 16, color: Colors.white70),
          ),

          const SizedBox(height: 40),

          Wrap(
            spacing: 16,
            children: [
              _chip("Secure educator access"),
              _chip("Personalized learning plans"),
            ],
          ),

          const Spacer(),

          const Text(
            "Need help? Contact support@diplomaplus.net",
            style: TextStyle(color: Colors.white70),
          ),
        ],
      ),
    );
  }

  Widget _chip(String label) {
    return Chip(
      backgroundColor: Colors.blue.shade200,
      label: Text(label, style: const TextStyle(color: Colors.white)),
    );
  }
}
