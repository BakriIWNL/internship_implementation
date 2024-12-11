import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomPinDot extends StatelessWidget {
  final double size;
  final int length;
  final double padding;
  final Color activeColor;
  final Color? inactiveColor;
  final Color borderColor;
  final TextEditingController? controller;

  const CustomPinDot({
    super.key,
    required this.size,
    required this.length,
    required this.activeColor,
    required this.borderColor,
    this.inactiveColor,
    this.padding = 10,
    this.controller,
  });
  
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size + (padding * 2),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        
        itemCount: length,
        itemBuilder: (context, index) {
          return _PinDotItemWidget(
            index: index,
            size: size,
            length: length,
            padding: padding,
            activeColor: activeColor,
            inactiveColor: inactiveColor,
            borderColor: borderColor,
            text: controller!.text,
          );
        },
      ),
    );
  }
}

class _PinDotItemWidget extends StatelessWidget {
  final double size;
  final int length;
  final int index;
  final double padding;
  final Color activeColor;
  final Color? inactiveColor;
  final Color borderColor;
  final String text;

  const _PinDotItemWidget({
    required this.size,
    required this.index,
    required this.length,
    required this.padding,
    required this.activeColor,
    required this.borderColor,
    required this.text,
    this.inactiveColor,
  });

  @override
  Widget build(BuildContext context) {
    var border = borderColor;
    Color? active = inactiveColor ?? Colors.transparent;
    if (text.length > index) {
      border = activeColor;
      active = activeColor;
    } else {
      border = borderColor;
      active = inactiveColor;
    }
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: padding.w),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(size),
              border: Border.all(color: border),
            ),
            child: Container(
              decoration: BoxDecoration(
                color: active,
                borderRadius: BorderRadius.circular(size),
                border: Border.all(width: 4.w,color: border)
              ),
              height: size,
              width: size,
            ),
          ),
        ),
      ],
    );
  }
}
