import 'package:dpng_staff/features/district_summative_library/widgets/summative_card.dart';
import 'package:dpng_staff/features/rubric_creation/steps/step5_rubric_levels.dart';
import 'package:dpng_staff/features/summative_creation/controller/link_controller.dart';
import 'package:dpng_staff/features/summative_creation/controller/summative_creation_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:get/route_manager.dart';

class SummativeLinkDialog extends StatelessWidget {
  SummativeLinkDialog({super.key, this.editId});
  final formKey = GlobalKey<FormState>();
  final linkController = Get.put(LinkController());
  final controller = Get.find<SummativeCreationController>();
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
                            'Add a link item.',
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
                    controller: linkController.descriptionController,
                    decoration: InputDecoration(
                      hintText: 'e.g. Graphic organizer for problem solving',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
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
                            Icon(Icons.link),
                            SizedBox(width: 10),
                            Text('Link'),

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
                  Text('Link'),
                  SizedBox(height: 5),
                  TextFormField(
                    controller: linkController.linkController,
                    decoration: InputDecoration(hintText: 'https://...'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Add link';
                      }
                      return null;
                    },
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
                          if (formKey.currentState!.validate()) {
                            if (editId == null) {
                              controller.addResource(
                                linkController.getLinkResource(),
                              );
                            } else {
                              controller.updateResource(
                                linkController.getLinkResource(
                                  editingId: editId,
                                ),
                              );
                            }
                            Navigator.of(context).pop();
                            Get.delete<LinkController>();
                            
                          }
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
