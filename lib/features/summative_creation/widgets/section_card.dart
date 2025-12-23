import 'package:dpng_staff/features/rubric_creation/steps/step5_rubric_levels.dart';
import 'package:flutter/material.dart';

class SectionCard extends StatefulWidget {
  final int index;
  final String title;
  final String subtitle;
  final bool locked;
  final bool completed;
  final Widget child;

  const SectionCard({
    super.key,
    required this.index,
    required this.title,
    required this.subtitle,
    required this.locked,
    required this.completed,
    required this.child,
  });

  @override
  State<SectionCard> createState() => _SectionCardState();
}

class _SectionCardState extends State<SectionCard> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: widget.locked ? 0.6 : 1,
      child: RoundContainer(
        color: Colors.white,
        circular: 20,
        // elevation: 1,
        // margin: const EdgeInsets.only(bottom: 12),
        child: Theme(
          data: Theme.of(context).copyWith(
            dividerColor: Colors.transparent, // hide divider line
            splashColor: Colors.transparent,
            hoverColor: Colors.transparent,
          ),
          child: ExpansionTile(
            initiallyExpanded: isExpanded,
            onExpansionChanged: (open) {
              if (!widget.locked) {
                setState(() => isExpanded = open);
              }
            },
            tilePadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 4,
            ),
            leading: Icon(
              widget.completed
                  ? Icons.check_circle
                  : widget.locked
                  ? Icons.lock
                  : Icons.menu_book_rounded,
              color: widget.completed
                  ? Colors.green
                  : widget.locked
                  ? Colors.grey
                  : Colors.black54,
            ),
            title: Text(
              widget.title,
              style: const TextStyle(fontWeight: FontWeight.w500),
            ),
            subtitle: Text(
              widget.subtitle,
              style: TextStyle(color: Colors.grey),
            ),
            trailing: Icon(
              isExpanded ? Icons.expand_less : Icons.expand_more,
              color: Colors.grey,
            ),
            children: [widget.child],
          ),
        ),
      ),
    );
  }
}
