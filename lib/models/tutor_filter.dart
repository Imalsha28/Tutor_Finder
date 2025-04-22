class TutorFilter {
  final String city;
  final String tuitionType;
  final String tuitionMedium;
  final String level;
  final String subject;
  final Set<String> selectedDates;
  final String time;
  final double minFee;
  final double maxFee;

  TutorFilter({
    required this.city,
    required this.tuitionType,
    required this.tuitionMedium,
    required this.level,
    required this.subject,
    required this.selectedDates,
    required this.time,
    required this.minFee,
    required this.maxFee,
  });
}
