import 'package:cat_app/src/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:cat_app/src/presentation/cubits/cubits.dart';
import 'package:cat_app/src/domain/use_case/use_cases.dart';

class CubitProvider extends StatelessWidget {
  final Widget child;

  const CubitProvider({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => CatCubit(
            getCatBreedsUseCase: locator<GetCatBreedsUseCase>(),
          ),
        ),
      ],
      child: child,
    );
  }
}
