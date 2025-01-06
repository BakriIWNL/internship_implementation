import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';
import 'package:itcores_internship_project/core/utils/enums.dart';

part 'camera_state.dart';

class CameraCubit extends Cubit<CameraState> {
  CameraCubit() : super(CameraState.initial());

  Future<void> addImage() async {
    emit(state.copyWith(image: null, status: CameraStatus.working));
    final XFile? returnedImage =
        await ImagePicker().pickImage(source: ImageSource.camera);

    if (returnedImage != null) {
      final image = File(returnedImage.path);
      emit(state.copyWith(image: image, status: CameraStatus.success));
    } else {
      emit(state.copyWith(status: CameraStatus.failed, image: null));
    }
  }

  Future<void> removeImage() async {
    debugPrint("REMOVING IMAGE");
    if (state.image != null) {
      emit(state.copyWith(image: null, status: CameraStatus.failed));
      debugPrint("CALLING THIS ${state.image}");
    } else {
      debugPrint("No image to remove");
    }
  }
}
