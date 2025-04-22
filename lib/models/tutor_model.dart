class TutorModel {
  final String name;
  final String subjects;
  final String tuitionType;
  final String availableDates;
  final String time;
  final String monthlyFees;
  final String description;
  final String location;
  final String city;
  final String teachingExp;
  final String education;
  final String tuitionLevel;
  final String tuitionMedium;
  final String feeType;

  final String academicExp;

  TutorModel({
    required this.name,
    required this.subjects,
    required this.tuitionType,
    required this.availableDates,
    required this.time,
    required this.monthlyFees,
    required this.description,
    required this.location,
    required this.city,
    required this.teachingExp,
    required this.education,
    required this.tuitionLevel,
    required this.tuitionMedium,
    required this.feeType,
    required this.academicExp,
  });

  Map<String, dynamic> toJson() => {
        'name': name,
        'subject': subjects,
        'tuitionType': tuitionType,
        'availableDates': availableDates,
        'time': time,
        'monthlyFees': monthlyFees,
        'description': description,
        'location': location,
        'city': city,
        'teachingExp': teachingExp,
        'education': education,
        'tuitionLevel': tuitionLevel,
        'tuitionMedium': tuitionMedium,
        'feeType': feeType,
        'academicExp': academicExp,
      };

  factory TutorModel.fromJson(Map<String, dynamic> json) => TutorModel(
        name: json['name'] ?? '',
        subjects: json['subject'] ?? '',
        tuitionType: json['tuitionType'] ?? '',
        availableDates: json['availableDates'] ?? '',
        time: json['time'] ?? '',
        location: json['location'] ?? '',
        city: json['city'] ?? '',
        teachingExp: json['teachingExp'] ?? '',
        education: json['education'] ?? '',
        monthlyFees: json['monthlyFees']?.toString() ?? '',
        tuitionLevel: json['tuitionLevel'] ?? '',
        tuitionMedium: json['tuitionMedium'] ?? '',
        feeType: json['feeType'] ?? '',
        academicExp: json['academicExp'] ?? '',
        description: json['description'] ?? '',
      );
}
