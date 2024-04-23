import 'package:patientmobileapplication/features/main_screens/profile_data/current_user.dart';

class ProfileData {
  CurrentUser currentUser = CurrentUser(
    name: '',
    email: '',
    dob: DateTime.now(),
    gender: '',
    address: '',
    phoneNumber: '',
    reports: [],
  );

  void addReport(String imagePath) {
    currentUser.reports.add(imagePath);
  }
}
