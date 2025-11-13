import 'package:flutter/material.dart';

class TrackToggle extends StatefulWidget {
  final void Function(String track)? onChanged;
  const TrackToggle({Key? key, this.onChanged}) : super(key: key);

  @override
  State<TrackToggle> createState() => _TrackToggleState();
}

class _TrackToggleState extends State<TrackToggle> {
  String active = 'A';

  void setActive(String t) {
    setState(() {
      active = t;
    });
    widget.onChanged?.call('Track $t');
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _chip('TRACK A', active == 'A', () => setActive('A')),
        const SizedBox(width: 12),
        _chip('TRACK B', active == 'B', () => setActive('B')),
      ],
    );
  }

  Widget _chip(String label, bool selected, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 18),
        decoration: BoxDecoration(
          color: selected ? Colors.white : Colors.transparent,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: selected ? Colors.black : Colors.black,
            width: 2,
          ),
        ),
        child: Text(
          label,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: selected ? Colors.black : Colors.green[700],
          ),
        ),
      ),
    );
  }
}
