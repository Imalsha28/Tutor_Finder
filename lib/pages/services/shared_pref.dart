import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceHelper {
  static String userIdkey = "USERKEY";
  static String userNamekey = "USERNAMEKEY";
  static String userEmailkey = "USERMAILKEY";
  static String userImagekey = "USERIMAGEKEY";
  static String isTutorKey = "ISTUTORKEY";
  static String tutorExpKey = "TUTOREXPKEY";
  static String tutorFeeKey = "TUTORFEEKEY";
  static String tutorGradesKey = "TUTORGRADESKEY";
  static String tutorSubjectKey = "TUTORSUBJECTKEY";
  static String tutorDaysKey = "TUTORDAYSKEY";
  static String tutorTimesKey = "TUTORTIMESKEY";
  static String tutorDescriptionKey = "TUTORDESCRIPTIONKEY";

  Future<bool> saveUserId(String getUserId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(userIdkey, getUserId);
  }

  Future<bool> saveUserName(String getUserName) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(userNamekey, getUserName);
  }

  Future<bool> saveUserEmail(String getUserEmail) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(userEmailkey, getUserEmail);
  }

  Future<bool> saveUserImage(String getUserImage) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(userImagekey, getUserImage);
  }

  Future<bool> saveIsTutor(bool isTutor) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setBool(isTutorKey, isTutor);
  }

  Future<bool> saveTutorExp(String exp) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(tutorExpKey, exp);
  }

  Future<bool> saveTutorFee(String fee) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(tutorFeeKey, fee);
  }

  Future<bool> saveTutorGrades(String grades) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(tutorGradesKey, grades);
  }

  Future<bool> saveTutorSubject(String subjects) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(tutorSubjectKey, subjects);
  }

  Future<bool> saveTutorDays(String days) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(tutorDaysKey, days);
  }

  Future<bool> saveTutorTimes(String times) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(tutorTimesKey, times);
  }

  Future<bool> saveTutorDescription(String description) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(tutorDescriptionKey, description);
  }

  Future<String?> getUserId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(userIdkey);
  }

  Future<String?> getUserName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(userNamekey);
  }

  Future<String?> getUserEmail() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(userEmailkey);
  }

  Future<String?> getUserImage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(userImagekey);
  }

  Future<bool> getIsTutor() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(isTutorKey) ?? false;
  }

  Future<String?> getTutorExp() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(tutorExpKey);
  }

  Future<String?> getTutorFee() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(tutorFeeKey);
  }

  Future<String?> getTutorGrades() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(tutorGradesKey);
  }

  Future<String?> getTutorSubject() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(tutorSubjectKey);
  }

  Future<String?> getTutorDays() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(tutorDaysKey);
  }

  Future<String?> getTutorTimes() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(tutorTimesKey);
  }

  Future<String?> getTutorDescription() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(tutorDescriptionKey);
  }
}
