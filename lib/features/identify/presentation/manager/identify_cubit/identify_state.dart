part of 'identify_cubit.dart';

abstract class IdentifyState {}

class IdentifyInitial extends IdentifyState {}

class IdentifyLoading extends IdentifyState {}

class IdentifySuccess extends IdentifyState {
  final IdentifyModel result;
  IdentifySuccess(this.result);
}

class IdentifyFailure extends IdentifyState {
  final String error;
  IdentifyFailure(this.error);
}
