part of 'otp_bloc.dart';

@immutable
abstract class OtpState {}

abstract class OtpActionState extends OtpState{}

class OtpInitial extends OtpState {}

class OtpCorrectOtpEnteredState extends OtpActionState{
  //Navigate to the next page
}

class OtpWrongOtpEnteredState extends OtpState{}