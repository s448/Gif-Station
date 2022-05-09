import 'package:flutter/material.dart';
import 'package:gif_project/constant/colors.dart';
import 'package:gif_project/router.dart';

void main(List<String> args) {
  runApp(MyApp(
    appRouter: AppRouter(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key, required this.appRouter}) : super(key: key);
  final AppRouter appRouter;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      color: primaryColor,
      showSemanticsDebugger: false,
      onGenerateRoute: appRouter.generateRoute,
    );
  }
}
