class Assessment {
  final String title;
  final String author;
  final String course;
  final String track;
  final String date;

  Assessment({
    required this.title,
    required this.author,
    required this.course,
    required this.track,
    required this.date,
  });
}

final List<Assessment> samplePending = [
  Assessment(
    title: '2. Building A Resume and Cover Letter 25–26',
    author: 'Vince C. (Sofia) Ochoa',
    course: 'Economics',
    track: 'Track B',
    date: '2025-10-16',
  ),
  Assessment(
    title: 'Presidential Powers 25–26',
    author: 'Allison Gutierrez-Mendez',
    course: 'US History B',
    track: 'Track A',
    date: '2025-10-16',
  ),
  Assessment(
    title: 'The New Deal 25–26',
    author: 'Cindy Navarro',
    course: 'US History B',
    track: 'Track A',
    date: '2025-10-17',
  ),
  Assessment(
    title: '3. Incentives, Supply, & Demand 25–26',
    author: 'Yara A. Galicia',
    course: 'Economics',
    track: 'Track A',
    date: '2025-10-17',
  ),
];
