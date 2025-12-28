import '../models/hub_model.dart';
import '../models/person_model.dart';

final hubs = [
  HubModel(
    id: 'course_1',
    title: 'English 9A Track A',
    subtitle: '5 students',
    type: HubType.course,
  ),
  HubModel(
    id: 'course_2',
    title: 'Great Books Track B',
    subtitle: '5 students',
    type: HubType.course,
  ),
  HubModel(
    id: 'staff',
    title: 'Staff Group',
    subtitle: '3 members',
    type: HubType.staff,
  ),
];

final students = [
  'Mayra',
  'Michelle',
  'Karla',
  'Ana',
  'Raphael',
].map(
  (e) => PersonModel(
    id: e,
    name: '$e Student',
    role: PersonRole.student,
  ),
).toList();

final staff = [
  'Dr. Brooks',
  'Mr. Garrett',
  'Ms. Slack',
].map(
  (e) => PersonModel(
    id: e,
    name: e,
    role: PersonRole.staff,
  ),
).toList();
