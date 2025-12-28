import 'package:dpng_staff/common/top_bar.dart';
import 'package:flutter/material.dart';
import '../data/mock_data.dart';
import '../models/hub_model.dart';
import '../models/person_model.dart';
import '../widgets/hub_list.dart';
import '../widgets/people_list.dart';
import 'chat_conversation_page.dart';

class CourseChatPage extends StatefulWidget {
  const CourseChatPage({super.key});

  @override
  State<CourseChatPage> createState() => _CourseChatPageState();
}

class _CourseChatPageState extends State<CourseChatPage> {
  HubModel? selectedHub;
  PersonModel? selectedPerson;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70),
        child: TopBar(
          type: 2,
          title: 'Course Chat',
          subtitle: 'Enter by course or staff group, then chat 1:1.',
          trailing: Row(
            children: [
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.indigoAccent,
                ),
                onPressed: () {},
                icon: Icon(Icons.add),
                label: Text('NEW'),
              ),
              SizedBox(width: 10),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
                child: Text('Reset', style: TextStyle(color: Colors.black)),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: const Color(0xFFF7F8FA),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            /// LEFT PANEL
            SizedBox(
              width: width * 0.4,
              child: Card(
                elevation: 1,
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: selectedHub == null
                    ? HubList(
                        hubs: hubs,
                        onSelect: (hub) {
                          setState(() {
                            selectedHub = hub;
                          });
                        },
                      )
                    : PeopleList(
                        hub: selectedHub!,
                        people: selectedHub!.type == HubType.course
                            ? students
                            : staff,
                        onBack: () {
                          setState(() {
                            selectedHub = null;
                            selectedPerson = null;
                          });
                        },
                        onSelect: (person) {
                          setState(() {
                            selectedPerson = person;
                          });
                        },
                      ),
              ),
            ),

            const SizedBox(width: 12),

            /// RIGHT PANEL
            Expanded(
              child: Card(
                elevation: 1,
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: selectedPerson == null
                    ? const Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Choose a course or Staff Group to start.',
                              style: TextStyle(fontSize: 18),
                            ),
                            SizedBox(height: 5),
                            Text(
                              'Use the left panel to choose where you want to chat.',
                              style: TextStyle(color: Colors.grey),
                            ),
                          ],
                        ),
                      )
                    : ChatConversationPage(
                        hub: selectedHub!,
                        person: selectedPerson!,
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
