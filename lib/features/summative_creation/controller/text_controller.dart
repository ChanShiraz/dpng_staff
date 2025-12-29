import 'dart:convert';

import 'package:dpng_staff/features/assess_summative/widgets/text_dialog.dart';
import 'package:dpng_staff/features/summative_creation/models/resource_row_data.dart';
import 'package:dpng_staff/features/summative_creation/widgets/resource_section.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:get/get.dart';

class TextController extends GetxController {
  final descriptionController = TextEditingController();
  // final textController = TextEditingController();
  QuillController quillController = QuillController.basic();

  ResourceRowData getLinkResource({int? editingId}) {
    return ResourceRowData(
      modnum: 0,
      id: editingId ?? DateTime.now().microsecondsSinceEpoch,
      description: descriptionController.text,
      type: 4,
      value: jsonEncode(quillController.document.toDelta().toJson()),
    );
  }

  void setValues(ResourceRowData data) {
    descriptionController.text = data.description;
    // Source - https://stackoverflow.com/a
    // Posted by Mubashir Saeed, modified by community. See post 'Timeline' for change history
    // Retrieved 2025-12-29, License - CC BY-SA 4.0

    quillController = buildController(data.value);
  }
}
