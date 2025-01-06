part of 'camera_cubit.dart';

class CameraState extends Equatable {
  final File? image;
  final CameraStatus status;

  const CameraState({required this.image, required this.status});

  factory CameraState.initial() {
    return const CameraState(image: null, status: CameraStatus.initializing);
  }

  CameraState copyWith({File? image, CameraStatus? status}) {
    return CameraState(
      image: image ?? this.image,
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props => [image, status]; 
}
