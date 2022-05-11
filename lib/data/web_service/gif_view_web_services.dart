import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:gif_project/constant/strings.dart';
import 'package:gif_project/data/model/category_model.dart';
import 'package:gif_project/data/model/gif_model.dart';

class HomeWebServices {
  late Dio? dio;
  HomeWebServices() {
    BaseOptions options = BaseOptions(
      baseUrl: baseUrl,
      receiveDataWhenStatusError: true,
      //connectTimeout: 20 * 1000,
      //receiveTimeout: 20 * 1000,
    );
    dio = Dio(options);
  }

  //take parameter query & limit and search for gifs
  searchForGif(String query) async {
    try {
      Response response =
          await dio!.get(searchUrl, queryParameters: {'q': query});
      GifsModel gifsModel = GifsModel.fromJson(response.data);
      return gifsModel.data as List;
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
      return [];
    }
  }

  //return the home head categories
  getCategories(String limit) async {
    try {
      Response response =
          await dio!.get(categoryUrl, queryParameters: {'limit': limit});
      CategoryModel categoryModel = CategoryModel.fromJson(response.data);
      return categoryModel.data as List;
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }

    return [];
  }

  //trendy gifs section
  getTrendyGifs(String limit) async {
    try {
      Response response =
          await dio!.get(baseUrl, queryParameters: {'limit': limit});
      GifsModel searchedData = GifsModel.fromJson(response.data);
      return searchedData.data as List;
    } catch (e) {
      if (kDebugMode) {
        print(e.toString() + "Error getting the trendy gifs");
      }
    }
    return [];
  }

  //get stickers
  getStickers(String limit) async {
    try {
      Response response =
          await dio!.get(stickersUrl, queryParameters: {'limit': limit});
      GifsModel searchedData = GifsModel.fromJson(response.data);
      return searchedData.data as List;
    } catch (e) {
      if (kDebugMode) {
        print(e.toString() + "Error getting the Stickers");
      }
    }
    return [];
  }
}

/*
  used in : 
  1-search
  3-trendy gifs
  4-stickers
  */
