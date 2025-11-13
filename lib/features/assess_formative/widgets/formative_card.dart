import 'package:flutter/material.dart';

class FormativeCard extends StatelessWidget {
  const FormativeCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Vince C. (Sofia) Ochoa • Economics", style: TextStyle()),
          const SizedBox(height: 8),
          Divider(),
          const SizedBox(height: 8),
          const Text(
            "Formative Assessment – What is economics",
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text("Description\nChecking for understanding"),
              Text("Date Submitted\n2025-10-16"),
              Text(
                "Open",
                style: TextStyle(
                  // color: Colors.blue,
                  decoration: TextDecoration.underline,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
        ],
      ),
    );
  }
}
