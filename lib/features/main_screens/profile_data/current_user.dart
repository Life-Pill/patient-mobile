class CurrentUser {
  String name;
String email;
DateTime dob;
String gender;
  String address;
  String phoneNumber;
  List<String> reports = [];
  List<String> prescriptions = [];

  CurrentUser({
    required this.name,
required this.email,
    required this.dob,
    required this.gender,
    required this.address,
    required this.phoneNumber,
    required this.reports,
    required this.prescriptions,
  });
}