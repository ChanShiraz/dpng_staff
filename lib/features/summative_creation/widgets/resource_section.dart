// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:dpng_staff/features/summative_creation/models/resource_row_data.dart';
import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:get/route_manager.dart';

import 'package:dpng_staff/features/home/controller/summative_controller.dart';
import 'package:dpng_staff/features/summative_creation/controller/link_controller.dart';
import 'package:dpng_staff/features/summative_creation/controller/summative_creation_controller.dart';
import 'package:dpng_staff/features/summative_creation/controller/text_controller.dart';
import 'package:dpng_staff/features/summative_creation/widgets/summative_link_dialog.dart';
import 'package:dpng_staff/features/summative_creation/widgets/summative_text_dialog.dart';

class ResourceSection extends StatelessWidget {
  final String title;
  final String subtitle;
  final String primaryButtonText;
  final String? secondaryButtonText;
  final IconData primaryIcon;
  final IconData? secondaryIcon;
  final List<ResourceRowData> rows;
  final VoidCallback onPrimaryTap;
  final VoidCallback? onSecondaryTap;

  const ResourceSection({
    super.key,
    required this.title,
    required this.subtitle,
    required this.primaryButtonText,
    this.secondaryButtonText,
    required this.rows,
    required this.primaryIcon,
    this.secondaryIcon,
    required this.onPrimaryTap,
    this.onSecondaryTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xffE2E8F0)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _Header(
            title: title,
            subtitle: subtitle,
            primaryButtonText: primaryButtonText,
            secondaryButtonText: secondaryButtonText,
            primaryIcon: primaryIcon,
            secondaryIcon: secondaryIcon,
            onPrimaryTap: onPrimaryTap,
            onSecondaryTap: onSecondaryTap,
          ),
          const SizedBox(height: 16),
          ResourceTable(rows: rows),
        ],
      ),
    );
  }
}

class _Header extends StatelessWidget {
  final String title;
  final String subtitle;
  final String primaryButtonText;
  final String? secondaryButtonText;
  final IconData primaryIcon;
  final IconData? secondaryIcon;
  final VoidCallback onPrimaryTap;
  final VoidCallback? onSecondaryTap;

  const _Header({
    required this.title,
    required this.subtitle,
    required this.primaryButtonText,
    this.secondaryButtonText,
    required this.primaryIcon,
    this.secondaryIcon,
    required this.onPrimaryTap,
    this.onSecondaryTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                subtitle,
                style: const TextStyle(fontSize: 13, color: Color(0xff64748B)),
              ),
            ],
          ),
        ),
        if (secondaryButtonText != null)
          _OutlinedBtn(
            text: secondaryButtonText!,
            iconData: secondaryIcon!,
            onTap: onSecondaryTap!,
          ),
        const SizedBox(width: 8),
        _OutlinedBtn(
          text: primaryButtonText,
          iconData: primaryIcon,
          onTap: onPrimaryTap,
        ),
      ],
    );
  }
}

class _OutlinedBtn extends StatelessWidget {
  final String text;
  final IconData iconData;
  final VoidCallback onTap;
  const _OutlinedBtn({
    required this.text,
    required this.iconData,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
      onPressed: onTap,
      icon: Icon(iconData, size: 18),
      label: Text(text),
      style: OutlinedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }
}

class ResourceTable extends StatelessWidget {
  final List<ResourceRowData> rows;

  const ResourceTable({super.key, required this.rows});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xffE2E8F0)),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const _TableHeader(),
          if (rows.isEmpty)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
              child: Text(
                'No item added yet.',
                style: TextStyle(color: Colors.grey),
              ),
            )
          else
            ...rows.map((row) => ResourceTableRow(data: row)),
        ],
      ),
    );
  }
}

class _TableHeader extends StatelessWidget {
  const _TableHeader();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: Color(0xffE2E8F0))),
      ),
      child: const Row(
        children: [
          Expanded(flex: 3, child: Text('Description')),
          Expanded(flex: 3, child: Text('Type/Instructions')),
          Expanded(flex: 2, child: Text('View')),
        ],
      ),
    );
  }
}

class ResourceTableRow extends StatelessWidget {
  final ResourceRowData data;
  final controller = Get.find<SummativeCreationController>();

  ResourceTableRow({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: Color(0xffE2E8F0))),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Text(
              data.description,
              style: const TextStyle(fontWeight: FontWeight.w500),
            ),
          ),
          Expanded(
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _TypeChip(label: data.type == 2 ? 'Link' : 'Text'),
                if (data.type == 2 && data.value.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.only(top: 6),
                    child: Text(
                      data.value,
                      style: const TextStyle(
                        fontSize: 12,
                        color: Color(0xff2563EB),
                      ),
                    ),
                  ),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Row(
              children: [
                OutlinedButton.icon(
                  onPressed: () {
                    print('data type ${data.type}');
                    if (data.type == 2) {
                      final linkController = Get.put(LinkController());
                      linkController.setValues(data);
                      showDialog(
                        context: context,
                        builder: (context) =>
                            SummativeLinkDialog(editId: data.id),
                      ).then((value) => Get.delete<LinkController>());
                    } 
                    else if (data.type == 4) {
                      final textController = Get.put(TextController());
                      textController.setValues(data);
                      showDialog(
                        context: context,
                        builder: (context) =>
                            SummativeTextDialog(editId: data.id),
                      ).then((value) => Get.delete<LinkController>());
                    }
                  },
                  icon: const Icon(Icons.visibility_outlined, size: 18),
                  label: const Text('View'),
                ),
                const SizedBox(width: 8),
                IconButton(
                  onPressed: () {
                    controller.removeResource(data);
                  },
                  icon: const Icon(Icons.delete_outline),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _TypeChip extends StatelessWidget {
  final String label;

  const _TypeChip({required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: const Color(0xffF1F5F9),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(label, style: const TextStyle(fontSize: 12)),
    );
  }
}
