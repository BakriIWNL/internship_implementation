part of 'camera_cubit.dart';

class CameraState extends Equatable {
  final CameraStatus status;
  final List<CameraDescription>? cameras;

  const CameraState({required this.status, this.cameras});

  factory CameraState.initial() =>
      const CameraState(status: CameraStatus.initializing);

  CameraState copyWith({
    CameraStatus? status,
    List<CameraDescription>? cameras,
  }) {
    return CameraState(
      status: status ?? this.status,
      cameras: cameras ?? this.cameras,
    );
  }

  @override
  List<Object?> get props => [status, cameras];
}
