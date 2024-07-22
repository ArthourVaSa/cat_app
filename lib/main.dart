import 'package:cat_app/src/config/config.dart';
import 'package:cat_app/src/config/providers/cubit_provider.dart';
import 'package:cat_app/src/locator.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initializeDependencies();

  runApp(
    const CubitProvider(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'Cat App',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.white,
          ),
          useMaterial3: true,
        ),
        routerConfig: AppRouter.router,
      );
    });
  }
}
