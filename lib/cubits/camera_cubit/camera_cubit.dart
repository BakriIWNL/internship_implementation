import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:camera/camera.dart';
import 'package:equatable/equatable.dart';
import 'package:itcores_internship_project/core/utils/enums.dart';

part 'camera_state.dart';

class CameraCubit extends Cubit<CameraState> {
  CameraCubit() : super(CameraState.initial());

  final _cameraController = StreamController<CameraController?>();
  Stream<CameraController?> get cameraStream => _cameraController.stream;

  Future<void> initializeCamera() async {
    try {
      emit(state.copyWith(status: CameraStatus.initializing));
      final cameras = await availableCameras();
      final firstCamera = cameras.first;

      final controller = CameraController(
        firstCamera,
        ResolutionPreset.high,
      );

      await controller.initialize();

      emit(state.copyWith(status: CameraStatus.available, cameras: cameras));
      _cameraController.add(controller);
    } catch (e) {
      emit(state.copyWith(status: CameraStatus.failed));
    }
  }

  Future<void> takePicture() async {
    final controller = await cameraStream.first;
    if (controller != null && controller.value.isInitialized) {
      await controller.takePicture();
    }
  }

  @override
  Future<void> close() async {
    final controller = await cameraStream.first;
    await controller?.dispose();
    return super.close();
  }
}