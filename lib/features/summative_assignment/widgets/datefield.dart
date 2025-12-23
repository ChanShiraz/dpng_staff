import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateField extends StatefulWidget {
  const DateField({super.key, this.dueDate, required this.onDateSelected});

  final DateTime? dueDate;
  final ValueChanged<DateTime> onDateSelected;

  @override
  State<DateField> createState() => _DateFieldState();
}

class _DateFieldState extends State<DateField> {
  DateTime? selectedDate;

  @override
  void initState() {
    super.initState();
    selectedDate = widget.dueDate;
  }

  @override
  Widget build(BuildContext context) {
    final String dateText = selectedDate != null
        ? DateFormat('dd/MM/yyyy').format(selectedDate!)
        : "dd/mm/yyyy";

    return InkWell(
      onTap: () async {
        DateTime? dateTime = await showDatePicker(
          context: context,
          initialDate: selectedDate ?? DateTime.now(),
          firstDate: DateTime.now(),
          lastDate: DateTime.now().add(const Duration(days: 365)),
        );

        if (dateTime != null) {
          setState(() {
            selectedDate = dateTime;
          });

          /// ✅ Return selected date
          widget.onDateSelected(dateTime);
        }
      },
      child: Container(
        height: 38,
        decoration: BoxDecoration(
          border: Border.all(color: const Color(0xffe2e8f0)),
          borderRadius: BorderRadius.circular(8),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              dateText,
              style: const TextStyle(fontSize: 13, color: Color(0xff94a3b8)),
            ),
            const Icon(
              Icons.calendar_today,
              size: 16,
              color: Color(0xff94a3b8),
            ),
          ],
        ),
      ),
    );
  }
}
