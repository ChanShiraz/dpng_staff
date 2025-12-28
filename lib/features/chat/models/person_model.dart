enum PersonRole { student, staff }

class PersonModel {
  final String id;
  final String name;
  final PersonRole role;

  PersonModel({
    required this.id,
    required this.name,
    required this.role,
  });
}
