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
  getTrendyGifs(String query, String limit) async {
    try {
      Response response = await dio!
          .get(searchUrl, queryParameters: {'q': query, 'limit': limit});
      GifsModel gifsModel = GifsModel.fromJson(response.data);
      return gifsModel.data as List;
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
      return [];
    }
  }

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

  /*
  used in : 
  1-search
  3-trendy gifs
  4-stickers
  */
  searchForGifsAndStickers(String query) async {
    try {
      Response response =
          await dio!.get(searchUrl, queryParameters: {'search': 'animals'});
      print("ffffffffffffffffffffff   " + response.realUri.toString());
      GifsModel searchedData = GifsModel.fromJson(response.data);
      return searchedData.data as List;
    } catch (e) {
      if (kDebugMode) {
        print(e.toString() + "ERRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRrrr");
      }
    }
    return [];
  }
}

      //print(gifsModel.data!.length);
      // Response response2 =
      //     await dio!.get("https://api.quran.com/api/v4/chapters?language=en");
      // CharactersClass charactersClass =
      //     CharactersClass.fromJson(response2.data);
      // print(charactersClass.chapters!);
