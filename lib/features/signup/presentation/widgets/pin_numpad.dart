import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:itcores_internship_project/core/themes/app_colors.dart';
import 'package:itcores_internship_project/features/signup/presentation/widgets/numpadbutton.dart';

class PinNumpad extends StatelessWidget {
  const PinNumpad({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController Text = TextEditingController();
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
                  onPressed: () {},
                ),
              );
            } else if (index == 10) {
              return NumpadButton(
                number: 0,
                onPressed: () {},
              );
            } else if (index == 11) {
              return Padding(
                padding: EdgeInsets.only(top: 6.h),
                child: IconButton(
                  icon: Icon(Icons.arrow_forward,color: AppColors.white,size: 50.sp,),
                  onPressed: () {},
                ),
              );
            }else {
              return NumpadButton(
                number: index + 1,
                onPressed: () {
                  Text.text = Text.text + (index + 1).toString();
                },
              );
            }
          },
        ),
      ),
    );
  }
}
