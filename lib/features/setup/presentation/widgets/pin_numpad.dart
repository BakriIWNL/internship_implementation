import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:itcores_internship_project/core/routes/route_names.dart';
import 'package:itcores_internship_project/core/themes/app_colors.dart';
import 'package:itcores_internship_project/features/setup/presentation/cubit/setup/setup_cubit.dart';
import 'package:itcores_internship_project/features/setup/presentation/widgets/numpad_buttons.dart';

class PinNumpad extends StatelessWidget {
  const PinNumpad({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: 2,
          ),
          itemCount: 12,
          itemBuilder: (context, index) {
            if (index == 9) {
              return Padding(
                padding: EdgeInsets.only(top: 6.h),
                child: IconButton(
                  icon: Icon(Icons.arrow_back,color: AppColors.white,size: 50.sp,),
                  onPressed: () {
                    return context.read<SetupCubit>().removedPin();
                  },
                ),
              );
            } else if (index == 10) {
              return NumpadButton(
                number: 0,
                controller: context.read<SetupCubit>().pinController,
              );
            } else if (index == 11) {
              return Padding(
                padding: EdgeInsets.only(top: 6.h),
                child: IconButton(
                  icon: Icon(Icons.arrow_forward,color: AppColors.white,size: 50.sp,),
                  onPressed: () {
                    if(context.read<SetupCubit>().checkComplete(context.read<SetupCubit>().pinController.text.length)){
                      context.go(RouteNames.letsSetup);
                    }
                  },
                ),
              );
            }else {
              return NumpadButton(
                number: index + 1,
                controller: context.read<SetupCubit>().pinController
              );
            }
          },
        ),
      ),
    );
  }
}
