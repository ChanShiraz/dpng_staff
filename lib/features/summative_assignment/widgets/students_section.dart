import 'package:dpng_staff/features/summative_assignment/widgets/summative_section.dart';
import 'package:flutter/material.dart';

class StudentsSection extends StatelessWidget {
  const StudentsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final students = ["Roberto Cruz", "Leon Morales-Reyes", "Sadrac Guillen"];

    return Container(
      decoration: BoxDecoration(
        border: BoxBorder.all(color: Colors.grey.shade200),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          HeaderRow(
            titles: ['Assign', 'Student Name', 'Student Email'],
            flexes: [1, 4, 5],
          ),
          Column(
            children: List.generate(students.length, (index) {
              return Container(
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(width: 1.5, color: Colors.grey.shade200),
                  ),
                  // borderRadius: index == students.length - 1
                  //     ? BorderRadius.circular(20)
                  //     : null,
                  color: index.isOdd ? const Color(0xfff8fafc) : null,
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 14,
                ),
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Align(
                        alignment: Alignment.bottomLeft,
                        child: Checkbox(value: true, onChanged: (_) {}),
                      ),
                    ),
                    Expanded(
                      flex: 4,
                      child: Text(
                        students[index],
                        style: const TextStyle(fontWeight: FontWeight.w500),
                      ),
                    ),
                    const Expanded(
                      flex: 5,
                      child: Text(
                        "student@email.com",
                        style: TextStyle(color: Color(0xff64748b)),
                      ),
                    ),
                  ],
                ),
              );
            }),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [Text('Assigned 3/3'), SaveButton()],
            ),
          ),
        ],
      ),
    );
  }
}

class SaveButton extends StatelessWidget {
  const SaveButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xfff8fafc),
          ),
          child: Text('Reset', style: TextStyle(color: Colors.black)),
        ),
        SizedBox(width: 10),
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
          child: Text('Save', style: TextStyle(color: Colors.white)),
        ),
      ],
    );
  }
}
