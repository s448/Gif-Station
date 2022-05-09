import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gif_project/constant/strings.dart';
import 'package:gif_project/controller/cubit/gif_view_cubit.dart';
import 'package:gif_project/data/repository/gif_view_repository.dart';
import 'package:gif_project/data/web_service/gif_view_web_services.dart';
import 'package:gif_project/view/screen/gif_view_screen.dart';
import 'package:gif_project/view/screen/home.dart';

class AppRouter {
  late HomeRepository homeRepository;
  late HomeCubit homeCubit;
  AppRouter() {
    homeRepository = HomeRepository(HomeWebServices());
    homeCubit = HomeCubit(homeRepository);
  }
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case homeRoute:
        return MaterialPageRoute(
          builder: (_) => BlocProvider<HomeCubit>(
            create: ((BuildContext context) => homeCubit),
            child: const HomeScreen(),
          ),
        );
      case gifViewScreenRoute:
        return MaterialPageRoute(
          builder: (_) => BlocProvider<HomeCubit>(
            create: ((BuildContext context) => homeCubit),
            child: const GifViewScreen(),
          ),
        );
    }
    return null;
  }
}
