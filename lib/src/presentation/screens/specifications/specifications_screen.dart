import 'package:cat_app/src/presentation/cubits/cubits.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

class SpecificationsScreen extends StatelessWidget {
  const SpecificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CatCubit, CatState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(state.catSelected!.name!),
          ),
          body: SafeArea(
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: 1.0.w,
              ),
              child: Column(
                children: [
                  Hero(
                    tag: 'cat_image_${state.catSelected!.id}',
                    child: Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Image.network(
                        'https://cdn2.thecatapi.com/images/${state.catSelected!.referenceImageId}.jpg',
                        width: double.infinity,
                        height: 50.0.h,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            width: double.infinity,
                            height: 50.0.h,
                            color: Colors.grey,
                            child: Center(
                              child: Text(
                                'Image not found',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16.0.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 2.0.h,
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Text(
                            state.catSelected!.description!,
                            style: TextStyle(
                              fontSize: 12.0.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          SizedBox(
                            height: 2.0.h,
                          ),
                          Text(
                            'Specifications',
                            style: TextStyle(
                              fontSize: 16.0.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const Divider(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                'Country Origin: ',
                                style: TextStyle(
                                  fontSize: 14.0.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Text(
                                state.catSelected!.origin!,
                                style: TextStyle(
                                  fontSize: 14.0.sp,
                                ),
                              ),
                            ],
                          ),
                          const Divider(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                'Weight (Kg): ',
                                style: TextStyle(
                                  fontSize: 14.0.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Text(
                                state.catSelected!.weight.metric,
                                style: TextStyle(
                                  fontSize: 14.0.sp,
                                ),
                              ),
                            ],
                          ),
                          const Divider(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                'Intelligence points: ',
                                style: TextStyle(
                                  fontSize: 14.0.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Text(
                                state.catSelected!.intelligence.toString(),
                                style: TextStyle(
                                  fontSize: 14.0.sp,
                                ),
                              ),
                            ],
                          ),
                          const Divider(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                'Afection level: ',
                                style: TextStyle(
                                  fontSize: 14.0.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Text(
                                state.catSelected!.affectionLevel.toString(),
                                style: TextStyle(
                                  fontSize: 14.0.sp,
                                ),
                              ),
                            ],
                          ),
                          const Divider(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                'Child friendly: ',
                                style: TextStyle(
                                  fontSize: 14.0.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Text(
                                state.catSelected!.childFriendly.toString(),
                                style: TextStyle(
                                  fontSize: 14.0.sp,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 2.0.h,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
