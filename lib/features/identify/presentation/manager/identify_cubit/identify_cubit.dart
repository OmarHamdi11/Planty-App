import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:planty/features/identify/data/models/identify_model.dart';
import 'package:planty/features/identify/data/models/identify_service.dart';

part 'identify_state.dart';

class IdentifyCubit extends Cubit<IdentifyState> {
  final IdentifyService service;

  IdentifyCubit(this.service) : super(IdentifyInitial());

  Future<void> identify(File imageFile) async {
    try {
      emit(IdentifyLoading());
      final result = await service.identifyPlant(imageFile);
      emit(IdentifySuccess(result));
    } catch (e) {
      emit(IdentifyFailure(e.toString()));
    }
  }

  void reset() {
    emit(IdentifyInitial());
  }
}
