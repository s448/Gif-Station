import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gif_project/constant/strings.dart';
import 'package:gif_project/controller/cubit/all_categories_cubit.dart';
import 'package:gif_project/controller/cubit/home_cubit.dart';
import 'package:gif_project/controller/cubit/stickers_view_cubit.dart';
import 'package:gif_project/controller/cubit/trendy_gifs_cubit.dart';
import 'package:gif_project/controller/cubit/view_gifs_cubit.dart';
import 'package:gif_project/data/repository/gif_view_repository.dart';
import 'package:gif_project/data/web_service/gif_view_web_services.dart';
import 'package:gif_project/view/screen/all_categories_screen.dart';
import 'package:gif_project/view/screen/gif_view_screen.dart';
import 'package:gif_project/view/screen/home_screen.dart';
import 'package:gif_project/view/screen/stickers_view_screen.dart';
import 'package:gif_project/view/screen/trendy_gifs_screen.dart';

class AppRouter {
  late HomeRepository homeRepository;
  late HomeCubit homeCubit;
  late ViewGifsCubit viewGifCubit;
  late AllCategoriesCubit allCategoriesCubit;
  late TrendyGifsCubit trendyGifsCubit;
  late StickersViewCubit stickersViewCubit;
  AppRouter() {
    homeRepository = HomeRepository(HomeWebServices());
    homeCubit = HomeCubit(homeRepository);
    allCategoriesCubit = AllCategoriesCubit(homeRepository);
    viewGifCubit = ViewGifsCubit(homeRepository);
    trendyGifsCubit = TrendyGifsCubit(homeRepository);
    stickersViewCubit = StickersViewCubit(homeRepository);
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
        final arg = settings.arguments as String;
        return MaterialPageRoute(
          builder: (_) => BlocProvider<ViewGifsCubit>(
            create: ((BuildContext context) => viewGifCubit),
            child: GifViewScreen(
              query: arg,
              // limit: args[1],
            ),
          ),
        );
      case allCategoriesRoute:
        return MaterialPageRoute(
          builder: (_) => BlocProvider<AllCategoriesCubit>(
            create: ((BuildContext context) => allCategoriesCubit),
            child: const AllCategories(),
          ),
        );
      case trendyGifsScreenRoute:
        return MaterialPageRoute(
          builder: (_) => BlocProvider<TrendyGifsCubit>(
            create: ((BuildContext context) => trendyGifsCubit),
            child: const TrendyGifs(),
          ),
        );
      case stickersScreenRoute:
        return MaterialPageRoute(
          builder: (_) => BlocProvider<StickersViewCubit>(
            create: ((BuildContext context) => stickersViewCubit),
            child: const StickersScreen(),
          ),
        );
    }
    return null;
  }
}
