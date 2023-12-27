part of 'otp_bloc.dart';

@immutable
abstract class OtpEvent {}

class OtpResendOtpButtonClickedEvent extends OtpEvent{}

class NumberPadValueClickedEvent extends OtpEvent{}