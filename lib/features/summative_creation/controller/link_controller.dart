import 'dart:math';

import 'package:dpng_staff/features/summative_creation/models/resource_row_data.dart';
import 'package:dpng_staff/features/summative_creation/widgets/resource_section.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class LinkController extends GetxController {
  final descriptionController = TextEditingController();
  final linkController = TextEditingController();

  ResourceRowData getLinkResource({int? editingId}) {
    return ResourceRowData(
      modnum: 0,
      id: editingId ?? DateTime.now().microsecondsSinceEpoch,
      description: descriptionController.text,
      type: 2,
      value: linkController.text,
    );
  }

  void setValues(ResourceRowData data) {
    descriptionController.text = data.description;
    linkController.text = data.value;
  }
}
