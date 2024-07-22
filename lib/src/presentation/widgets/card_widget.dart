import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CardWidget extends StatelessWidget {

  final Widget child;

  const CardWidget({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50.0.h,
      margin: EdgeInsets.symmetric(
        horizontal: 2.0.w,
        vertical: 1.0.h,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: child,
    );
  }
}