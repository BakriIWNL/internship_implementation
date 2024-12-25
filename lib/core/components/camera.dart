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
            return FutureBuilder<CameraController?>(
              future: BlocProvider.of<CameraCubit>(context).cameraStream.first,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done && snapshot.hasData) {
                  final controller = snapshot.data!;
                  return Stack(
                    children: [
                      CameraPreview(controller),
                      Align(
                        child: ElevatedButton(
                          onPressed: () async {
                            await BlocProvider.of<CameraCubit>(context).takePicture();
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Picture taken!')),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            shape: const CircleBorder(),
                            padding: const EdgeInsets.all(16),
                            backgroundColor: Colors.blue,
                          ),
                          child: const Icon(Icons.camera, size: 32, color: Colors.white),
                        ),
                      ),
                    ],
                  );
                } else if (snapshot.hasError) {
                  return const Center(child: Text('Error loading camera'));
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              },
            );
          case CameraStatus.failed:
            return const Center(child: Text('Error initializing camera'));
        }
      },
    );
  }
}
