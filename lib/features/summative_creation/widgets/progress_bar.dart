import 'package:flutter/material.dart';

class ProgressBar extends StatelessWidget {
  final int? openStep;
  final bool step1Complete;
  final bool step2Complete;
  final Function(int) onStepTap;
  const ProgressBar({
    super.key,
    required this.openStep,
    required this.step1Complete,
    required this.step2Complete,
    required this.onStepTap,
  });
  @override
  Widget build(BuildContext context) {
    return ProgressStepper(
      steps: [
        StepData(
          stepNumber: 1,
          title: 'Scope',
          subtitle: 'Main DP Alignment',
          status: StepStatus.completed,
        ),
        StepData(
          stepNumber: 2,
          title: 'Rubric',
          subtitle: 'Competencies & Standards',
          status: StepStatus.active,
        ),
        StepData(
          stepNumber: 3,
          title: 'Details',
          subtitle: 'Title • Deliverable • Rubric',
          status: StepStatus.inactive,
        ),
      ],
    );
  }
}

// ---
// ## 1. Data Model for Steps
// ---

class StepData {
  final int stepNumber;
  final String title;
  final String subtitle;
  final StepStatus status;

  StepData({
    required this.stepNumber,
    required this.title,
    required this.subtitle,
    this.status = StepStatus.inactive,
  });
}

enum StepStatus { completed, active, inactive }

class ProgressStepper extends StatelessWidget {
  const ProgressStepper({super.key, required this.steps});

  // Define the data for the steps
  final List<StepData> steps;

  @override
  Widget build(BuildContext context) {
    return Row(
      // Ensure the steps are spaced out nicely
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: _buildSteps(steps),
    );
  }

  // Method to build the list of Step and Connector widgets
  List<Widget> _buildSteps(List<StepData> steps) {
    final List<Widget> widgets = [];
    for (int i = 0; i < steps.length; i++) {
      widgets.add(StepWidget(data: steps[i]));

      // 2. Add a Connector Line after every step except the last one
      if (i < steps.length - 1) {
        widgets.add(
          // Flexible ensures the connector line takes up remaining space
          Flexible(
            child: ConnectorLine(
              startStatus: steps[i].status,
              endStatus: steps[i + 1].status,
            ),
          ),
        );
      }
    }
    return widgets;
  }
}

// ---
// ## 3. Component: StepWidget (Icon + Text)
// ---

class StepWidget extends StatelessWidget {
  final StepData data;

  const StepWidget({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // The circular icon for the step
        StepIcon(data: data),
        const SizedBox(width: 10),
        // Title text
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              data.title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14,
                color: _getTitleColor(data.status),
              ),
            ),
            const SizedBox(height: 4),
            // Subtitle text
            Text(
              data.subtitle,
              style: TextStyle(
                fontSize: 12,
                color: _getSubtitleColor(data.status),
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ],
    );
  }

  Color _getTitleColor(StepStatus status) {
    switch (status) {
      case StepStatus.completed:
      case StepStatus.active:
        return Colors.black;
      case StepStatus.inactive:
        return Colors.grey.shade700;
    }
  }

  Color _getSubtitleColor(StepStatus status) {
    // switch (status) {
    // case StepStatus.completed:
    // case StepStatus.active:
    //   return const Color(0xFF57CC99); // Greenish color from the image
    // case StepStatus.inactive:
    return Colors.grey.shade500;
    //  }
  }
}

// ---
// ## 4. Component: StepIcon (The Circle)
// ---

class StepIcon extends StatelessWidget {
  final StepData data;

  const StepIcon({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: _getBackgroundColor(data.status),
        border: _getBorder(data.status),
      ),
      child: Center(child: _getIconContent(data.status, data.stepNumber)),
    );
  }

  Color _getBackgroundColor(StepStatus status) {
    switch (status) {
      case StepStatus.completed:
        return const Color(0xFF57CC99); // Green for completed
      case StepStatus.active:
        return Colors.black; // Dark blue/purple for active
      case StepStatus.inactive:
        return Colors.white; // White/light grey for inactive
    }
  }

  Border? _getBorder(StepStatus status) {
    if (status == StepStatus.inactive) {
      return Border.all(color: Colors.grey.shade400, width: 1);
    }
    return null; // No border for completed or active
  }

  Widget _getIconContent(StepStatus status, int stepNumber) {
    switch (status) {
      case StepStatus.completed:
        // Checkmark for completed step
        return const Icon(Icons.check, color: Colors.white, size: 24);
      case StepStatus.active:
        // Step number for active step
        return Text(
          '$stepNumber',
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        );
      case StepStatus.inactive:
        // Step number for inactive step
        return Text(
          '$stepNumber',
          style: TextStyle(
            color: Colors.grey.shade400,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        );
    }
  }
}

// ---
// ## 5. Component: ConnectorLine (The Line Between Steps)
// ---

class ConnectorLine extends StatelessWidget {
  final StepStatus startStatus;
  final StepStatus endStatus;

  const ConnectorLine({
    super.key,
    required this.startStatus,
    required this.endStatus,
  });

  @override
  Widget build(BuildContext context) {
    final color =
        (startStatus == StepStatus.completed ||
            startStatus == StepStatus.active)
        ? const Color(0xFF57CC99)
        : Colors.grey.shade300;

    return Container(
      height: 2, // Thickness of the line
      margin: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(2),
      ),
    );
  }
}
