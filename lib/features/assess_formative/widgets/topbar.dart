import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class Topbar extends StatelessWidget {
  const Topbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,

      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                IconButton(
                  onPressed: () => Get.back(),
                  icon: Icon(Icons.arrow_back_ios_new),
                ),
                SizedBox(width: 10),
                Text(
                  'Assessment Center / Assess Student Formative',
                  style: Theme.of(
                    context,
                  ).textTheme.bodySmall?.copyWith(color: Colors.grey[600]),
                ),
              ],
            ),
            Row(
              children: [
                OutlinedButton(
                  onPressed: () {},
                  child: Text('Help', style: TextStyle(color: Colors.black)),
                ),
                SizedBox(width: 10),
                OutlinedButton(
                  onPressed: () {},
                  child: Text('More', style: TextStyle(color: Colors.black)),
                ),
                SizedBox(width: 20),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
