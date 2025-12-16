import 'package:dpng_staff/features/course/model/summative.dart';
import 'package:dpng_staff/features/summative_assignment/widgets/datefield.dart';
import 'package:flutter/material.dart';

class SummativeSection extends StatelessWidget {
  const SummativeSection({super.key,required this.summative});
final Summative summative;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          HeaderRow(
            titles: const ["Summative Title", "Task", "Due Date"],
            flexes: [3, 5, 1],
          ),
          _DataRow(
            title: summative.title,
            description:
                summative.task,
          ),
        ],
      ),
    );
  }
}

class _DataRow extends StatelessWidget {
  final String title;
  final String description;

  const _DataRow({required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Text(
              title,
              style: const TextStyle(
                color: Color(0xff16a34a),
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: Text(
              description,
              style: const TextStyle(
                color: Color(0xff16a34a),
                fontStyle: FontStyle.italic,
              ),
            ),
          ),
          const Expanded(
            flex: 1,
            child: Align(alignment: Alignment.centerRight, child: DateField()),
          ),
        ],
      ),
    );
  }
}

class HeaderRow extends StatelessWidget {
  final List<String> titles;
  final List<int>? flexes;

  const HeaderRow({super.key, required this.titles, this.flexes});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      decoration: const BoxDecoration(
        color: Color(0xfff8fafc),
        border: Border(bottom: BorderSide(color: Color(0xffe2e8f0))),
        borderRadius: BorderRadiusDirectional.only(
          topEnd: Radius.circular(20),
          topStart: Radius.circular(20),
        ),
      ),
      child: Row(
        children: List.generate(titles.length, (index) {
          return Expanded(
            flex: flexes?[index] ?? 1,
            child: Text(
              titles[index],
              // textAlign:
              // index == titles.length - 1
              //     ? TextAlign.right
              //     : TextAlign.left,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: Color(0xff64748b),
                letterSpacing: 0.5,
              ),
            ),
          );
        }),
      ),
    );
  }
}
