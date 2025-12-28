import 'package:dpng_staff/features/rubric_creation/steps/step5_rubric_levels.dart';
import 'package:dpng_staff/features/summative_creation/controller/link_controller.dart';
import 'package:dpng_staff/features/summative_creation/controller/summative_creation_controller.dart';
import 'package:dpng_staff/features/summative_creation/controller/text_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class SummativeTextDialog extends StatelessWidget {
  SummativeTextDialog({super.key, this.editId});

  final formKey = GlobalKey<FormState>();
  final controller = Get.put(TextController());
  final summativeCreationController = Get.find<SummativeCreationController>();
  int? editId;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        width: 600,
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //mainAxisSize: MainAxisSize.min,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Add Summative Resource',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            'Add a text item.',
                            style: TextStyle(fontSize: 12, color: Colors.grey),
                          ),
                        ],
                      ),
                      IconButton(
                        onPressed: () => Navigator.of(context).pop(),
                        icon: Icon(Icons.cancel_outlined),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Divider(),
                  SizedBox(height: 20),
                  Text('Description'),
                  SizedBox(height: 5),
                  TextFormField(
                    controller: controller.descriptionController,
                    decoration: InputDecoration(
                      hintText: 'e.g. Graphic organizer for problem solving',
                    ),
                    validator: (value) {
                      if (value == null || value.isNotEmpty) {
                        return 'Add description';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Text('Type/Instructions'),
                      SizedBox(width: 10),
                      RoundContainer(
                        child: Row(
                          children: [
                            Icon(Icons.text_snippet_outlined),
                            SizedBox(width: 10),
                            Text('Text'),

                            SizedBox(width: 5),
                            Text(
                              '(not editable)',
                              style: TextStyle(color: Colors.grey),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  RichTextInput(
                    controller: controller.quillController,
                    label: 'Text',
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Tip: paste formatted text and use the toolbar for quick edits.',
                    style: TextStyle(color: Colors.grey),
                  ),
                  SizedBox(height: 20),
                  Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      OutlinedButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text('Cancel'),
                      ),
                      SizedBox(width: 10),
                      ElevatedButton(
                        onPressed: () {
                          summativeCreationController.addResource(
                            controller.getLinkResource(),
                          );
                          Navigator.of(context).pop();
                          Get.delete<TextController>();
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                        ),
                        child: Text(
                          'Submit',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class RichTextInput extends StatelessWidget {
  final QuillController controller;
  final String? label;
  final bool showToolBar;

  const RichTextInput({
    super.key,
    required this.controller,
    required this.label,
    this.showToolBar = true,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        label != null ? Text(label!) : SizedBox(),
        const SizedBox(height: 8),

        /// Toolbar
        showToolBar
            ? Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(color: const Color(0xffE2E8F0)),
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(12),
                  ),
                ),
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: QuillSimpleToolbar(
                    controller: controller,
                    config: const QuillSimpleToolbarConfig(
                      showListCheck: false,
                      showInlineCode: false,
                      showSubscript: false,
                      showSuperscript: false,
                      showFontFamily: false,
                      showFontSize: false,
                      showColorButton: false,
                      showBackgroundColorButton: false,
                      showAlignmentButtons: false,
                      showCodeBlock: false,
                      showQuote: false,
                      showLink: false,
                      showUndo: false,
                      showRedo: false,
                      showStrikeThrough: false,
                      showClearFormat: false,
                      showHeaderStyle: false,
                      showIndent: false,
                      showSearchButton: false,
                    ),
                  ),
                ),
              )
            : SizedBox.fromSize(),

        /// Editor
        Container(
          height: 180,
          decoration: BoxDecoration(
            border: Border.all(color: const Color(0xffE2E8F0)),
            borderRadius: const BorderRadius.vertical(
              bottom: Radius.circular(12),
            ),
          ),
          child: QuillEditor.basic(
            controller: controller,
            focusNode: FocusNode(),
            scrollController: ScrollController(),
            // scrollable: true,
            // padding: const EdgeInsets.all(16),
            // autoFocus: false,
            // readOnly: false,
            // expands: false,
            // placeholder:
            //     'Paste formatted text and use the toolbar for quick edits.',
          ),
        ),
      ],
    );
  }
}
