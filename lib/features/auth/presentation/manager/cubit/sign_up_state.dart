part of 'sign_up_cubit.dart';

@immutable
abstract class SignUpState {}

class SignUpInitial extends SignUpState {}

class SignUpLoading extends SignUpState {}

class SignUpSuccess extends SignUpState {
  final String message;

  SignUpSuccess({required this.message});
}

class SignUpFailure extends SignUpState {
  final String error;

  SignUpFailure({required this.error});
}
