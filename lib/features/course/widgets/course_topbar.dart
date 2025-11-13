import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class CourseTopbar extends StatelessWidget {
  const CourseTopbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Card(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () => Get.back(),
                      icon: Icon(Icons.arrow_back_ios),
                    ),
                    SizedBox(width: 10),
                    Text(
                      'Back to Dashboard',
                      style: TextStyle(color: Colors.black),
                    ),
                  ],
                ),
              ),

              Row(
                children: [
                  OutlinedButton(
                    onPressed: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(Icons.calendar_month_rounded, color: Colors.black),
                        SizedBox(width: 15),
                        Text('Calendar', style: TextStyle(color: Colors.black)),
                      ],
                    ),
                  ),
                  SizedBox(width: 10),
                  OutlinedButton(
                    onPressed: () {},
                    child: Row(
                      children: [
                        Icon(Icons.message_outlined, color: Colors.black),
                        SizedBox(width: 15),
                        Text('Messages', style: TextStyle(color: Colors.black)),
                      ],
                    ),
                  ),
                  SizedBox(width: 20),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
