import 'dart:convert';

import 'package:dpng_staff/features/rubric_creation/steps/step5_rubric_levels.dart';
import 'package:dpng_staff/features/summative_creation/widgets/summative_text_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:flutter_quill/quill_delta.dart';

class TextDialog extends StatelessWidget {
  final QuillController quillController;

  TextDialog({super.key, String? initialText})
    : quillController = _buildController(initialText);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.4,
            child: RichTextInput(
              showToolBar: false,
              controller: quillController,
              label: null,
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Close'),
            ),
          ),
        ],
      ),
    );
  }
}

QuillController _buildController(String? jsonText) {
  if (jsonText == null || jsonText.isEmpty) {
    return QuillController.basic();
  }

  final delta = Delta.fromJson(jsonDecode(jsonText));
  final document = Document.fromDelta(delta);

  return QuillController(
    document: document,
    selection: const TextSelection.collapsed(offset: 0),
  );
}
