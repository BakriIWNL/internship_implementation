import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:itcores_internship_project/core/components/custom_button.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:itcores_internship_project/core/routes/route_names.dart';

class LetsSetup extends StatelessWidget {
  const LetsSetup({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            111.verticalSpace,
            SizedBox(
              width: 343.w,
              height: 100.h,
              child: Text(context.localizations.setupAccount,style: TextStyle(fontWeight: FontWeight.w500,fontSize: 36.sp), )
              ),
              37.verticalSpace,
              SizedBox(
              width: 343.w,
              height: 50.h,
              child: Text(context.localizations.accountCanBe, style: TextStyle(fontWeight: FontWeight.w500,fontSize: 14.sp))
              ),
              420.verticalSpace,
              CustomButton(text: context.localizations.letsGo, onPressed: (){
                context.go(RouteNames.newAccount);
              }, size: Size(343.w,56.h),)
          ],
        ),
      ),
    );
  }
}
