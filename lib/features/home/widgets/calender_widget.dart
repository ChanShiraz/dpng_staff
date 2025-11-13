import 'package:flutter/material.dart';

class CalendarWidget extends StatefulWidget {
  const CalendarWidget({super.key});

  @override
  State<CalendarWidget> createState() => _CalendarWidgetState();
}

class _CalendarWidgetState extends State<CalendarWidget> {
  DateTime focused = DateTime.now();
  DateTime selected = DateTime.now();

  void _prevMonth() {
    setState(() {
      focused = DateTime(focused.year, focused.month - 1);
    });
  }

  void _nextMonth() {
    setState(() {
      focused = DateTime(focused.year, focused.month + 1);
    });
  }

  List<DateTime> _daysInMonth(DateTime month) {
    final first = DateTime(month.year, month.month, 1);
    final daysBefore = first.weekday % 7; // Sun=7 %7=0
    final firstToShow = first.subtract(Duration(days: daysBefore));
    final total = 42; // 6 weeks
    return List.generate(total, (i) => firstToShow.add(Duration(days: i)));
  }

  @override
  Widget build(BuildContext context) {
    final days = _daysInMonth(focused);
    final monthLabel = '${_monthName(focused.month)} ${focused.year}';

    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                IconButton(
                  onPressed: _prevMonth,
                  icon: const Icon(Icons.chevron_left),
                ),
                Expanded(
                  child: Center(
                    child: Text(
                      monthLabel,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                IconButton(
                  onPressed: _nextMonth,
                  icon: const Icon(Icons.chevron_right),
                ),
              ],
            ),
            const SizedBox(height: 6),
            // weekday labels
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: ['Su', 'Mo', 'Tu', 'We', 'Th', 'Fr', 'Sa']
                  .map(
                    (d) => Expanded(
                      child: Center(
                        child: Text(
                          d,
                          style: const TextStyle(color: Colors.black54),
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
            const SizedBox(height: 8),
            // days grid
            Expanded(
              child: GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 7,
                ),
                itemCount: days.length,
                itemBuilder: (context, i) {
                  final d = days[i];
                  final isCurrentMonth = d.month == focused.month;
                  final isSelected =
                      d.year == selected.year &&
                      d.month == selected.month &&
                      d.day == selected.day;

                  return GestureDetector(
                    onTap: () => setState(() => selected = d),
                    child: Container(
                      margin: const EdgeInsets.all(6),
                      decoration: isSelected
                          ? BoxDecoration(
                              shape: BoxShape.circle,
                              color: Theme.of(context).colorScheme.primary,
                            )
                          : null,
                      child: Center(
                        child: Text(
                          '${d.day}',
                          style: TextStyle(
                            color: isCurrentMonth
                                ? (isSelected ? Colors.white : Colors.black87)
                                : Colors.black26,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _monthName(int m) {
    const names = [
      '',
      'January',
      'February',
      'March',
      'April',
      'May',
      'June',
      'July',
      'August',
      'September',
      'October',
      'November',
      'December',
    ];
    return names[m];
  }
}
