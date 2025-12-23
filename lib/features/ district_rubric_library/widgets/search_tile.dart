// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchTile extends StatelessWidget {
  const SearchTile({super.key});

  @override
  Widget build(BuildContext context) {
    final border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(20),
      borderSide: BorderSide(color: Colors.grey.shade300),
    );

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: TextField(
              style: TextStyle(fontSize: 14),
              decoration: InputDecoration(
                enabledBorder: border,
                focusedBorder: border,
                errorBorder: border,
                focusedErrorBorder: border,
                fillColor: Colors.white,
                filled: true,
                hintText:
                    'Search by title, course, author, standard, competency, criterion...',
              ),
            ),
          ),
          SizedBox(width: 10),
          Expanded(
            child: CustomDropDown(
              leading: Icons.filter_alt_outlined,
              items: [
                DropdownMenuItem(
                  child: Text('All Subjects', style: TextStyle(fontSize: 14)),
                ),
              ],
              trailing: Icons.keyboard_arrow_down,
              onChange: (p0) {},
            ),
          ),
          SizedBox(width: 10),
          Expanded(
            child: CustomDropDown(
              leading: Icons.filter_alt_outlined,
              items: [
                DropdownMenuItem(
                  child: Text('All Schools', style: TextStyle(fontSize: 14)),
                ),
              ],
              trailing: Icons.keyboard_arrow_down,
              onChange: (p0) {},
            ),
          ),
          SizedBox(width: 10),
          Expanded(
            child: CustomDropDown(
              leading: Icons.sort,
              items: [
                DropdownMenuItem(
                  child: Text('Title A-Z', style: TextStyle(fontSize: 14)),
                ),
              ],
              trailing: Icons.keyboard_arrow_down,
              onChange: (p0) {},
            ),
          ),
        ],
      ),
    );
  }
}

class CustomDropDown extends StatelessWidget {
  const CustomDropDown({
    super.key,
    required this.leading,
    required this.items,
    required this.trailing,
    required this.onChange,
  });
  final IconData leading;
  final List<DropdownMenuItem> items;
  final IconData trailing;
  final Function(dynamic) onChange;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      padding: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Row(
        children: [
          Icon(leading, size: 20),
          SizedBox(width: 10),
          Expanded(
            child: DropdownButton(
              style: TextStyle(fontSize: 14, color: Colors.black),
              isExpanded: true,
              icon: Icon(trailing, size: 20),
              underline: SizedBox(),
              items: items,
              onChanged: onChange,
            ),
          ),
        ],
      ),
    );
  }
}
