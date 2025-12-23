import 'package:dpng_staff/features/summative_creation/models/resource_row_data.dart';
import 'package:dpng_staff/features/summative_creation/widgets/resource_section.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:get/get.dart';

class TextController extends GetxController {
  final descriptionController = TextEditingController();
  // final textController = TextEditingController();
  final QuillController quillController = QuillController.basic();

  ResourceRowData getLinkResource({int? editingId}) {
    return ResourceRowData(
      modnum: 0,
      id: editingId ?? DateTime.now().microsecondsSinceEpoch,
      description: descriptionController.text,
      type: 4,
      value: quillController.plainTextEditingValue.text,
    );
  }

  void setValues(ResourceRowData data) {
    descriptionController.text = data.description;
    // quillController. = data.value;
  }
}
