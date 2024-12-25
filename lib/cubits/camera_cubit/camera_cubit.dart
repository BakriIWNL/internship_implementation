import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:camera/camera.dart';
import 'package:equatable/equatable.dart';
import 'package:itcores_internship_project/core/utils/enums.dart';

part 'camera_state.dart';

class CameraCubit extends Cubit<CameraState> {
  CameraCubit() : super(CameraState.initial());

  CameraController? _cameraController;

  CameraController? get cameraController => _cameraController;

  Future<void> initializeCamera() async {
    try {
      emit(state.copyWith(status: CameraStatus.initializing));
      final cameras = await availableCameras();
      final firstCamera = cameras.first;

      _cameraController = CameraController(
        firstCamera,
        ResolutionPreset.high,
      );

      await _cameraController!.initialize();

      emit(state.copyWith(status: CameraStatus.available, cameras: cameras));
    } catch (e) {
      emit(state.copyWith(status: CameraStatus.failed));
    }
  }

  Future<void> takePicture() async {
    if (_cameraController != null && _cameraController!.value.isInitialized) {
      await _cameraController!.takePicture();
    } else {
      throw StateError('CameraController is not initialized');
    }
  }

  @override
  Future<void> close() async {
    await _cameraController?.dispose();
    return super.close();
  }
}
