import 'package:flutter/material.dart';

class ResourcesSection extends StatelessWidget {
  final List<String> resources;
  const ResourcesSection({super.key, required this.resources});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Divider(height: 1, color: Color(0xffe2e8f0)),
          const SizedBox(height: 10),
          Row(children: const [
            Icon(Icons.description, size: 18),
            SizedBox(width: 8),
            Text("Summative Resources", style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600)),
          ]),
          const SizedBox(height: 10),
          ...resources.map((r) => Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: GestureDetector(
                  onTap: () {
                    // Hook to open resource
                  },
                  child: Text(
                    r,
                    style: const TextStyle(color: Colors.blue, fontSize: 14, decoration: TextDecoration.underline),
                  ),
                ),
              )),
        ],
      ),
    );
  }
}
