import 'package:cat_app/src/utils/constants/gifs.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class LoaginWidget extends StatelessWidget {
  const LoaginWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset(
        AppGifs.loading,
        width: 80.0.w,
      ),
    );
  }
}