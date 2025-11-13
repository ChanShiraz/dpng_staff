import 'package:flutter/material.dart';

class FinalSubmissionCard extends StatelessWidget {
  const FinalSubmissionCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Final Submission Information",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 6),
            child: Divider(),
          ),
          const Text("Guidelines", style: TextStyle(color: Colors.black54)),
          const SizedBox(height: 8),
          const Text(
            "Please input a comment for the student regarding their performance on the summative:",
          ),
          const SizedBox(height: 8),

          TextField(
            minLines: 4,
            keyboardType: TextInputType.multiline,
            maxLines: null,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Colors.black38),
              ),
              hintText: "Type feedback...",
              hintStyle: TextStyle(color: Colors.black54),
            ),
          ),
          const SizedBox(height: 16),
          const Text("Select Summative Acceptance Status:"),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8,
            children: [
              _statusButton("SUMMATIVE ACCEPTED"),
              _statusButton("SUMMATIVE RESUBMIT"),
            ],
          ),
          const SizedBox(height: 20),
          Align(
            alignment: Alignment.centerRight,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 12,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              onPressed: () {},
              child: const Text("Submit Assessment"),
            ),
          ),
        ],
      ),
    );
  }

  Widget _statusButton(String text) => OutlinedButton(
    style: OutlinedButton.styleFrom(
      foregroundColor: Colors.black,
      side: const BorderSide(color: Colors.black26),
    ),
    onPressed: () {},
    child: Text(text),
  );
}
