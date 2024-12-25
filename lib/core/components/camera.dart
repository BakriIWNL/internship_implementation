import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:itcores_internship_project/core/utils/enums.dart';
import 'package:itcores_internship_project/cubits/camera_cubit/camera_cubit.dart';

class CameraPage extends StatelessWidget {
  const CameraPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CameraCubit, CameraState>(
      builder: (context, state) {
        switch (state.status) {
          case CameraStatus.initializing:
            return const Center(child: CircularProgressIndicator());
          case CameraStatus.available:
            final controller = context.read<CameraCubit>().cameraController;
            if (controller != null && controller.value.isInitialized) {
              return Scaffold(
                body: Stack(
                  children: [
                    CameraPreview(controller),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: ElevatedButton(
                        onPressed: () async {
                          try {
                            await context.read<CameraCubit>().takePicture();
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Picture taken!')),
                            );
                          } catch (e) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Error: $e')),
                            );
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          shape: const CircleBorder(),
                          padding: const EdgeInsets.all(16),
                          backgroundColor: Colors.blue,
                        ),
                        child: const Icon(Icons.camera,
                            size: 32, color: Colors.white),
                      ),
                    ),
                  ],
                ),
              );
            } else {
              return const Center(child: Text('Camera not ready'));
            }
          case CameraStatus.failed:
            return const Center(child: Text('Error initializing camera'));
        }
      },
    );
  }
}
